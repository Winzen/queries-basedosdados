{{ config(alias='dicionario', schema='br_rf_cafir') }}

SELECT 
SAFE_CAST(id_tabela AS STRING) id_tabela,
SAFE_CAST(nome_coluna AS STRING) nome_coluna,
SAFE_CAST(chave AS STRING) chave,
SAFE_CAST(cobertura_temporal AS STRING) cobertura_temporal,
SAFE_CAST(valor AS STRING) valor

FROM basedosdados-staging.br_rf_cafir_staging.dicionario AS t 