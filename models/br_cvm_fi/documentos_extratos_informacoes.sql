{{ 
  config(
    schema='br_cvm_fi',
    materialized='table',
     partition_by={
      "field": "ano",
      "data_type": "int64",
      "range": {
        "start": 2015,
        "end": 2023,
        "interval": 1}
    },
    cluster_by =  ["mes", "data_competencia"])
 }}
SELECT
SAFE_CAST(ano AS INT64) ano,
SAFE_CAST(mes AS INT64) mes,
REGEXP_REPLACE(cnpj, r'[^0-9]', '') AS cnpj,
SUBSTR(REGEXP_REPLACE(cnpj, r'[^0-9]', ''), 1, 8) AS cnpj_basico,
SAFE_CAST(denominacao_social AS STRING) denominacao_social,
SAFE_CAST(data_competencia AS DATE) data_competencia,
SAFE_CAST(condominio AS STRING) condominio,
SAFE_CAST(indicador_negociacao_mercado AS INT64) indicador_negociacao_mercado,
SAFE_CAST(nome_mercado AS STRING) nome_mercado,
SAFE_CAST(tipo_prazo AS STRING) tipo_prazo,
SAFE_CAST(prazo AS STRING) prazo,
SAFE_CAST(publico_alvo AS STRING) publico_alvo,
SAFE_CAST(indicador_registro_anbima AS INT64) indicador_registro_anbima,
SAFE_CAST(classificacao_anbima AS STRING) classificacao_anbima,
SAFE_CAST(forma_distribuicao AS STRING) forma_distribuicao,
SAFE_CAST(politica_investimento AS STRING) politica_investimento,
SAFE_CAST(porcentagem_aplicacao_maximo_fundo_ligado AS FLOAT64) porcentagem_aplicacao_maximo_fundo_ligado,
SAFE_CAST(indicador_resultados_carteira_incorporado_patrimonio_liquido AS INT64) indicador_resultados_carteira_incorporado_patrimonio_liquido,
SAFE_CAST(indicador_fundo_cotas AS INT64) indicador_fundo_cotas,
SAFE_CAST(indicador_fundo_espelho AS INT64) indicador_fundo_espelho,
SAFE_CAST(aplicacao_minima AS FLOAT64) aplicacao_minima,
SAFE_CAST(indicador_atualizacao_diaria_cota AS INT64) indicador_atualizacao_diaria_cota,
SAFE_CAST(prazo_atualizacao_valor_cota AS STRING) prazo_atualizacao_valor_cota,
SAFE_CAST(cota_emissao AS STRING) cota_emissao,
SAFE_CAST(patrimonio_liquido_cota AS STRING) patrimonio_liquido_cota,
SAFE_CAST(quantidade_dias_conversao_cota AS INT64) quantidade_dias_conversao_cota,
SAFE_CAST(quantidade_dias_pagamento_cota AS INT64) quantidade_dias_pagamento_cota,
SAFE_CAST(quantidade_dias_carencia_resgate_cotas AS INT64) quantidade_dias_carencia_resgate_cotas,
SAFE_CAST(quantidade_dias_pagamento_resgates AS INT64) quantidade_dias_pagamento_resgates,
SAFE_CAST(tipo_prazo_pagamento_resgates AS STRING) tipo_prazo_pagamento_resgates,
SAFE_CAST(indicador_cobranca_taxa_saida_resgates AS INT64) indicador_cobranca_taxa_saida_resgates,
SAFE_CAST(taxa_administracao AS FLOAT64) taxa_administracao,
SAFE_CAST(taxa_maxima_custodia AS FLOAT64) taxa_maxima_custodia,
SAFE_CAST(indicador_taxa_performance AS INT64) indicador_taxa_performance,
SAFE_CAST(taxa_performance AS FLOAT64) taxa_performance,
SAFE_CAST(parametro_taxa_performance AS STRING) parametro_taxa_performance,
SAFE_CAST(porcentagem_indice_referencia_taxa_performance AS FLOAT64) porcentagem_indice_referencia_taxa_performance,
SAFE_CAST(valor_cumpom AS FLOAT64) valor_cumpom,
SAFE_CAST(metodo_calculo_taxa_performance AS STRING) metodo_calculo_taxa_performance,
SAFE_CAST(informacoes_adicionais_taxa_performance AS STRING) informacoes_adicionais_taxa_performance,
SAFE_CAST(indicador_taxa_ingresso AS INT64) indicador_taxa_ingresso,
SAFE_CAST(taxa_ingresso_real AS FLOAT64) taxa_ingresso_real,
SAFE_CAST(porcentagem_taxa_ingresso AS FLOAT64) porcentagem_taxa_ingresso,
SAFE_CAST(indicador_cobranca_taxa_saida AS INT64) indicador_cobranca_taxa_saida,
SAFE_CAST(taxa_saida_real AS FLOAT64) taxa_saida_real,
SAFE_CAST(porcentagem_taxa_saida AS FLOAT64) porcentagem_taxa_saida,
SAFE_CAST(indicador_operacoes_derivativos AS INT64) indicador_operacoes_derivativos,
SAFE_CAST(finalidade_operacoes_derivativos AS STRING) finalidade_operacoes_derivativos,
SAFE_CAST(indicador_operacoes_valor_superior_patrimonio_liquido AS INT64) indicador_operacoes_valor_superior_patrimonio_liquido,
SAFE_CAST(fator_limite_total_operacoes_patrimonio_liquido AS FLOAT64) fator_limite_total_operacoes_patrimonio_liquido,
SAFE_CAST(indicador_contraparte_ligado AS INT64) indicador_contraparte_ligado,
SAFE_CAST(indicador_investimentos_exterior AS INT64) indicador_investimentos_exterior,
SAFE_CAST(aplicacao_maxima_ativo_exterior AS FLOAT64) aplicacao_maxima_ativo_exterior,
SAFE_CAST(indicador_ativo_credito_privado AS INT64) indicador_ativo_credito_privado,
SAFE_CAST(aplicacao_maxima_ativo_credito_privado AS FLOAT64) aplicacao_maxima_ativo_credito_privado,
SAFE_CAST(porcentagem_exposicao_minima_emissor_instituicao_financeira AS FLOAT64) porcentagem_exposicao_minima_emissor_instituicao_financeira,
SAFE_CAST(porcentagem_exposicao_maxima_emissor_instituicao_financeira AS FLOAT64) porcentagem_exposicao_maxima_emissor_instituicao_financeira,
SAFE_CAST(porcentagem_exposicao_minima_emissor_companhias_abertas AS FLOAT64) porcentagem_exposicao_minima_emissor_companhias_abertas,
SAFE_CAST(porcentagem_exposicao_maxima_emissor_companhias_abertas AS FLOAT64) porcentagem_exposicao_maxima_emissor_companhias_abertas,
SAFE_CAST(porcentagem_exposicao_minima_emissor_fundos_investimento AS FLOAT64) porcentagem_exposicao_minima_emissor_fundos_investimento,
SAFE_CAST(porcentagem_exposicao_maxima_emissor_fundos_investimento AS FLOAT64) porcentagem_exposicao_maxima_emissor_fundos_investimento,
SAFE_CAST(porcentagem_exposicao_minima_emissor_uniao_federal AS FLOAT64) porcentagem_exposicao_minima_emissor_uniao_federal,
SAFE_CAST(porcentagem_exposicao_maxima_emissor_uniao_federal AS FLOAT64) porcentagem_exposicao_maxima_emissor_uniao_federal,
SAFE_CAST(porcentagem_exposicao_minima_emissor_adm_gestor_pessoas_ligadas AS FLOAT64) porcentagem_exposicao_minima_emissor_adm_gestor_pessoas_ligadas,
SAFE_CAST(porcentagem_exposicao_maxima_emissor_adm_gestor_pessoas_ligadas AS FLOAT64) porcentagem_exposicao_maxima_emissor_adm_gestor_pessoas_ligadas,
SAFE_CAST(porcentagem_exposicao_minima_emissor_outros AS FLOAT64) porcentagem_exposicao_minima_emissor_outros,
SAFE_CAST(porcentagem_exposicao_maxima_emissor_outros AS FLOAT64) porcentagem_exposicao_maxima_emissor_outros,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fi AS FLOAT64) porcentagem_exposicao_minima_cotas_fi,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fi AS FLOAT64) porcentagem_exposicao_maxima_cotas_fi,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fic AS FLOAT64) porcentagem_exposicao_minima_cotas_fic,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fic AS FLOAT64) porcentagem_exposicao_maxima_cotas_fic,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fi_qualificados AS FLOAT64) porcentagem_exposicao_minima_cotas_fi_qualificados,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fi_qualificados AS FLOAT64) porcentagem_exposicao_maxima_cotas_fi_qualificados,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fic_qualificados AS FLOAT64) porcentagem_exposicao_minima_cotas_fic_qualificados,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fic_qualificados AS FLOAT64) porcentagem_exposicao_maxima_cotas_fic_qualificados,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fi_profissionais AS FLOAT64) porcentagem_exposicao_minima_cotas_fi_profissionais,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fi_profissionais AS FLOAT64) porcentagem_exposicao_maxima_cotas_fi_profissionais,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fic_profissionais AS FLOAT64) porcentagem_exposicao_minima_cotas_fic_profissionais,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fic_profissionais AS FLOAT64) porcentagem_exposicao_maxima_cotas_fic_profissionais,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fii AS FLOAT64) porcentagem_exposicao_minima_cotas_fii,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fii AS FLOAT64) porcentagem_exposicao_maxima_cotas_fii,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fidc AS FLOAT64) porcentagem_exposicao_minima_cotas_fidc,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fidc AS FLOAT64) porcentagem_exposicao_maxima_cotas_fidc,
SAFE_CAST(porcentagem_exposicao_minima_cotas_ficfidc AS FLOAT64) porcentagem_exposicao_minima_cotas_ficfidc,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_ficfidc AS FLOAT64) porcentagem_exposicao_maxima_cotas_ficfidc,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fidic_np AS FLOAT64) porcentagem_exposicao_minima_cotas_fidic_np,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fidic_np AS FLOAT64) porcentagem_exposicao_maxima_cotas_fidic_np,
SAFE_CAST(porcentagem_exposicao_minima_cotas_ficfidic_np AS FLOAT64) porcentagem_exposicao_minima_cotas_ficfidic_np,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_ficfidc_np AS FLOAT64) porcentagem_exposicao_maxima_cotas_ficfidc_np,
SAFE_CAST(porcentagem_exposicao_minima_cotas_etf AS FLOAT64) porcentagem_exposicao_minima_cotas_etf,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_etf AS FLOAT64) porcentagem_exposicao_maxima_cotas_etf,
SAFE_CAST(porcentagem_exposicao_minima_cota_cri AS FLOAT64) porcentagem_exposicao_minima_cota_cri,
SAFE_CAST(porcentagem_exposicao_maxima_cota_cri AS FLOAT64) porcentagem_exposicao_maxima_cota_cri,
SAFE_CAST(porcentagem_exposicao_minima_titulos_publicos_operacoes_comprimessadas AS FLOAT64) porcentagem_exposicao_minima_titulos_publicos_operacoes_comprimessadas,
SAFE_CAST(porcentagem_exposicao_maxima_titulos_publicos_operacoes_comprimessadas AS FLOAT64) porcentagem_exposicao_maxima_titulos_publicos_operacoes_comprimessadas,
SAFE_CAST(porcentagem_exposicao_minima_ouro AS FLOAT64) porcentagem_exposicao_minima_ouro,
SAFE_CAST(porcentagem_exposicao_maxima_ouro AS FLOAT64) porcentagem_exposicao_maxima_ouro,
SAFE_CAST(porcentagem_exposicao_minima_titulos_instituicao_financeira_bacen AS FLOAT64) porcentagem_exposicao_minima_titulos_instituicao_financeira_bacen,
SAFE_CAST(porcentagem_exposicao_maxima_titulos_instituicao_financeira_bacen AS FLOAT64) porcentagem_exposicao_maxima_titulos_instituicao_financeira_bacen,
SAFE_CAST(porcentagem_exposicao_minima_valores_mobiliarios AS FLOAT64) porcentagem_exposicao_minima_valores_mobiliarios,
SAFE_CAST(porcentagem_exposicao_maxima_valores_mobiliarios AS FLOAT64) porcentagem_exposicao_maxima_valores_mobiliarios,
SAFE_CAST(porcentagem_exposicao_minima_acoes AS FLOAT64) porcentagem_exposicao_minima_acoes,
SAFE_CAST(porcentagem_exposicao_maxima_acoes AS FLOAT64) porcentagem_exposicao_maxima_acoes,
SAFE_CAST(porcentagem_exposicao_minima_debenture AS FLOAT64) porcentagem_exposicao_minima_debenture,
SAFE_CAST(porcentagem_exposicao_maxima_debenture AS FLOAT64) porcentagem_exposicao_maxima_debenture,
SAFE_CAST(porcentagem_exposicao_minima_notas_promissorias AS FLOAT64) porcentagem_exposicao_minima_notas_promissorias,
SAFE_CAST(porcentagem_exposicao_maxima_notas_promissorias AS FLOAT64) porcentagem_exposicao_maxima_notas_promissorias,
SAFE_CAST(porcentagem_exposicao_minima_operacoes_compromissadas_titulos_credito_privado AS FLOAT64) porcentagem_exposicao_minima_operacoes_compromissadas_titulos_credito_privado,
SAFE_CAST(porcentagem_exposicao_maxima_operacoes_compromissadas_titulos_credito_privado AS FLOAT64) porcentagem_exposicao_maxima_operacoes_compromissadas_titulos_credito_privado,
SAFE_CAST(porcentagem_exposicao_minima_derivativos AS FLOAT64) porcentagem_exposicao_minima_derivativos,
SAFE_CAST(porcentagem_exposicao_maxima_derivativos AS FLOAT64) porcentagem_exposicao_maxima_derivativos,
SAFE_CAST(porcentagem_exposicao_minima_outros AS FLOAT64) porcentagem_exposicao_minima_outros,
SAFE_CAST(porcentagem_exposicao_maxima_outros AS FLOAT64) porcentagem_exposicao_maxima_outros,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fmiee AS FLOAT64) porcentagem_exposicao_minima_cotas_fmiee,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fmiee AS FLOAT64) porcentagem_exposicao_maxima_cotas_fmiee,
SAFE_CAST(porcentagem_exposicao_minima_cotas_fip AS FLOAT64) porcentagem_exposicao_minima_cotas_fip,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_fip AS FLOAT64) porcentagem_exposicao_maxima_cotas_fip,
SAFE_CAST(porcentagem_exposicao_minima_cotas_ficfip AS FLOAT64) porcentagem_exposicao_minima_cotas_ficfip,
SAFE_CAST(porcentagem_exposicao_maxima_cotas_ficfip AS FLOAT64) porcentagem_exposicao_maxima_cotas_ficfip,
FROM basedosdados-staging.br_cvm_fi_staging.documentos_extratos_informacoes AS t

