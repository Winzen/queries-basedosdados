{{ config(
    materialized='table',
    partition_by={
      "field": "data_consulta",
      "data_type": "date",
      "granularity": "day"
    }
)}}


WITH tabela_ordenada as (
SELECT
  PARSE_DATE('%Y-%m-%d', dia) AS data_consulta,
TIME(
  EXTRACT(HOUR FROM PARSE_DATETIME('%Y-%m-%d %H:%M:%S', data_hora)),
  EXTRACT(MINUTE FROM PARSE_DATETIME('%Y-%m-%d %H:%M:%S', data_hora)),
  EXTRACT(SECOND FROM PARSE_DATETIME('%Y-%m-%d %H:%M:%S', data_hora))
) AS hora_consulta,
  secao_site,
  LPAD(item_id, 12, '0') AS id_item,
  CASE
    WHEN vendedor='None' THEN NULL
    ELSE vendedor
  END vendedor,
  titulo,
  categorias,
  CASE 
    WHEN categorias = '[]' THEN null
    WHEN  TRIM(JSON_EXTRACT_ARRAY(categorias)[OFFSET(1)], '"') = '...' THEN 
      TRIM(JSON_EXTRACT_ARRAY(categorias)[OFFSET(2)], '"')
    WHEN TRIM(JSON_EXTRACT_ARRAY(categorias)[OFFSET(0)], '"') = '...' THEN 
      TRIM(JSON_EXTRACT_ARRAY(categorias)[OFFSET(1)], '"')
    ELSE TRIM(JSON_EXTRACT_ARRAY(categorias)[OFFSET(0)], '"')  
  END as categoria_principal,
  CASE 
    when categorias = '[]' then null
    WHEN TRIM(JSON_EXTRACT_ARRAY(categorias)[OFFSET(1)], '"') = '...' THEN 
      ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(JSON_EXTRACT_ARRAY(categorias)) AS x WITH OFFSET
                              WHERE OFFSET > 3), ', ')    
    WHEN TRIM(JSON_EXTRACT_ARRAY(categorias)[OFFSET(0)], '"') = '...' THEN 
      ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(JSON_EXTRACT_ARRAY(categorias)) AS x WITH OFFSET
                              WHERE OFFSET > 1), ', ')
    ELSE ARRAY_TO_STRING(ARRAY(SELECT x FROM UNNEST(JSON_EXTRACT_ARRAY(categorias)) AS x WITH OFFSET
                              WHERE OFFSET > 0), ', ')
  END as outras_categorias,
  CASE
    WHEN caracteristicas = '{}' THEN NULL
    ELSE caracteristicas
  END caracteristicas,
  SAFE_CAST(envio_pais AS BOOL) envio_nacional,
  SAFE_CAST(quantidade_avaliacoes AS INT64) quantidade_avaliacao,
  SAFE_CAST(estrelas AS FLOAT64) avaliacao,
  SAFE_CAST(
    CASE 
      WHEN preco_original = 'nan' THEN null 
      ELSE preco_original
    END AS FLOAT64) AS preco_original,
  SAFE_CAST(desconto AS INT64) desconto,
  SAFE_CAST (preco AS FLOAT64) AS preco,
FROM
  `basedosdados-staging.br_mercadolivre_ofertas_staging.item`

), tabela_preco AS (
  SELECT
    data_consulta,
    hora_consulta,
    secao_site,
    id_item,
    titulo,
    vendedor,
    categoria_principal,
    REGEXP_REPLACE(
      TRIM(outras_categorias, '"'),
      r'("([^"]+)")',
      r'\2'
    ) as outras_categorias,
      caracteristicas,
      envio_nacional,
      quantidade_avaliacao,
      avaliacao,
      CASE  
        WHEN preco_original < preco THEN preco
        WHEN preco_original = preco THEN  null
        ELSE preco_original
      END preco_original,
      desconto,
      CASE
        WHEN preco > preco_original THEN preco_original
        WHEN preco = preco_original THEN  null
        ELSE preco
      END preco_final,
  FROM 
    tabela_ordenada 

), tabela_desconto_calculado AS

(SELECT 
  data_consulta,
  hora_consulta,
  id_item,
  titulo,
  id_vendor as id_vendedor,
  vendedor,
  a.categoria_principal,
  outras_categorias,
  caracteristicas,
  envio_nacional,
  quantidade_avaliacao,
  avaliacao, 
  ROUND(
    CASE 
      WHEN preco_original IS NULL THEN preco_final * 100 / (100 - desconto)
      ELSE preco_original
    END, 2
  ) AS preco_original,
  CAST(
    CASE
      WHEN desconto IS NULL THEN 100 - (preco_final * 100 / preco_original)
      ELSE desconto
    END AS INT
  ) AS desconto,
  CAST(100 - (100 * preco_final / preco_original) AS int64) desconto_caclculado,
  ROUND(
    CASE
      WHEN preco_final IS NULL THEN preco_original * (100 - desconto) / 100
      ELSE preco_final
    END, 2
  ) AS preco_final

FROM  tabela_preco a

LEFT JOIN
(SELECT
  DISTINCT
    dia,
    LPAD(id_vendor, 12, '0') as id_vendor,
    nome
FROM
    `basedosdados-staging.br_mercadolivre_ofertas_staging.vendedor`)  b
ON a.vendedor = b.nome and data_consulta = PARSE_DATE('%Y-%m-%d', dia)
WHERE NOT (preco_original IS NULL AND preco_final IS NULL)
  AND NOT (preco_final IS NULL AND desconto IS NULL)
  AND NOT (preco_original IS NULL AND desconto IS NULL))
SELECT 
  data_consulta,
  hora_consulta,
  id_item,
  titulo,
  id_vendedor,
  vendedor,
  categoria_principal,
  outras_categorias,
  caracteristicas,
  envio_nacional,
  quantidade_avaliacao,
  avaliacao, 
  preco_original,
  CASE 
    WHEN ABS(desconto_caclculado - desconto) > 3 THEN desconto_caclculado
    ELSE desconto
  END as desconto,
  preco_final
FROM tabela_desconto_calculado