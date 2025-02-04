{{ config(alias='indigenas_domicilio_morador_municipio',schema='br_ibge_censo_2022') }}
WITH ibge as (
SELECT
municipio,
SAFE_CAST(TRIM(REGEXP_EXTRACT(municipio, r'([^\(]+)')) AS STRING) nome_municipio,
SAFE_CAST(TRIM(REGEXP_EXTRACT(municipio, r'\(([^)]+)\)')) AS STRING) sigla_uf,
SAFE_CAST(localizacao_do_domicilio AS STRING) localizacao_domicilio,
SAFE_CAST(domicilios_particulares_permanentes_ocupados_domicilios_ AS INT64) domicilios,
SAFE_CAST(moradores_em_domicilios_particulares_permanentes_ocupados_pessoas_ AS INT64) moradores,
SAFE_CAST(moradores_indigenas_em_domicilios_particulares_permanentes_ocupados_pessoas_ AS INT64) moradores_indigenas,
#SAFE_CAST(REPLACE(media_de_moradores_em_domicilios_particulares_permanentes_ocupados_pessoas_, ",", ".") AS FLOAT64) media_moradores_domicilios,
#SAFE_CAST(REPLACE(media_de_moradores_indigenas_em_domicilios_particulares_permanentes_ocupados_com_pelo_menos_um_morador_indigena_pessoas_, ",", ".") AS FLOAT64) media_moradores_indigenas_domicilios,
FROM basedosdados-staging.br_ibge_censo_2022_staging.indigenas_domicilio_morador_municipio AS t)
select t2.cod as id_municipio, ibge.* except(municipio, nome_municipio,sigla_uf) 
from ibge
left join `basedosdados-dev.br_ibge_censo_2022_staging.auxiliary_table` t2
on ibge.municipio = t2.municipio




