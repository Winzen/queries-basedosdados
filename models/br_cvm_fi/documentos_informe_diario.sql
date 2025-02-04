{{ 
  config(
    schema='br_cvm_fi',
    materialized='table',
     partition_by={
      "field": "ano",
      "data_type": "int64",
      "range": {
        "start": 2000,
        "end": 2023,
        "interval": 1}
    },
    cluster_by =  ["mes", "id_fundo"])
 }}
SELECT
SAFE_CAST(ano AS INT64) ano,
SAFE_CAST(mes AS INT64) mes,
SAFE_CAST(id_fundo AS STRING) id_fundo,
REGEXP_REPLACE(cnpj, r'[^0-9]', '') AS cnpj,
SUBSTR(REGEXP_REPLACE(cnpj, r'[^0-9]', ''), 1, 8) AS cnpj_basico,
SAFE_CAST(data_competencia AS DATE) data_competencia,
SAFE_CAST(valor_total AS FLOAT64) valor_total,
SAFE_CAST(valor_cota AS FLOAT64) valor_cota,
SAFE_CAST(valor_patrimonio_liquido AS FLOAT64) valor_patrimonio_liquido,
SAFE_CAST(captacao_dia AS FLOAT64) captacao_dia,
SAFE_CAST(regate_dia AS FLOAT64) resgate_dia,
SAFE_CAST(quantidade_cotistas AS INT64) quantidade_cotistas,
FROM basedosdados-staging.br_cvm_fi_staging.documentos_informe_diario AS t

