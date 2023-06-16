{{ 
  config(
    schema='br_cvm_fi',
    materialized='table',
     partition_by={
      "field": "ano",
      "data_type": "int64",
      "range": {
        "start": 2019,
        "end": 2023,
        "interval": 1}
    },
    cluster_by =  ["mes", "data_competencia"],
    labels = {'project_id': 'basedosdados', 'tema': 'economia'})
 }}
SELECT
SAFE_CAST(ano AS INT64) ano,
SAFE_CAST(mes AS INT64) mes,
SAFE_CAST(cnpj AS STRING) cnpj,
SAFE_CAST(denominacao_social AS STRING) denominacao_social,
SAFE_CAST(data_competencia AS STRING) data_competencia,
SAFE_CAST(versao AS STRING) versao,
SAFE_CAST(quantidade_clientes_cotitstas_pessoa_fisica_private_banking AS INT64) quantidade_clientes_cotitstas_pessoa_fisica_private_banking,
SAFE_CAST(quantidade_clientes_cotitstas_pessoa_fisica_varejo AS INT64) quantidade_clientes_cotitstas_pessoa_fisica_varejo,
SAFE_CAST(quantidade_clientes_cotistas_pessoa_juridica_nao_financeira_private_banking AS INT64) quantidade_clientes_cotistas_pessoa_juridica_nao_financeira_private_banking,
SAFE_CAST(quantidade_clientes_cotistas_pessoa_juridica_nao_financeira_varejo AS INT64) quantidade_clientes_cotistas_pessoa_juridica_nao_financeira_varejo,
SAFE_CAST(quantidade_clientes_cotitstas_banco_comercial AS INT64) quantidade_clientes_cotitstas_banco_comercial,
SAFE_CAST(quantidade_clientes_cotistas_corretora_distribuidora AS INT64) quantidade_clientes_cotistas_corretora_distribuidora,
SAFE_CAST(quantidade_clientes_cotistas_outras_pessoas_juridicas_financeiras AS INT64) quantidade_clientes_cotistas_outras_pessoas_juridicas_financeiras,
SAFE_CAST(quantidade_clientes_cotistas_investidores_nao_residentes AS INT64) quantidade_clientes_cotistas_investidores_nao_residentes,
SAFE_CAST(quantidade_clientes_cotistas_entidade_aberta_previdencia_complementar AS INT64) quantidade_clientes_cotistas_entidade_aberta_previdencia_complementar,
SAFE_CAST(quantidade_clientes_cotistas_entidade_fechada_previdencia_complementar AS INT64) quantidade_clientes_cotistas_entidade_fechada_previdencia_complementar,
SAFE_CAST(quantidade_clientes_cotistas_regime_proprio_previdencia_servidores_publicos AS INT64) quantidade_clientes_cotistas_regime_proprio_previdencia_servidores_publicos,
SAFE_CAST(quantidade_clientes_cotistas_sociedade_seguradora_resseguradora AS INT64) quantidade_clientes_cotistas_sociedade_seguradora_resseguradora,
SAFE_CAST(quantidade_clientes_cotistas_sociedade_capitalizacao_arrendamento_mercantil AS INT64) quantidade_clientes_cotistas_sociedade_capitalizacao_arrendamento_mercantil,
SAFE_CAST(quantidade_clientes_cotistas_fundos_clubes_investimento AS INT64) quantidade_clientes_cotistas_fundos_clubes_investimento,
SAFE_CAST(quantidade_clientes_cotistas_distribuidores_fundo AS INT64) quantidade_clientes_cotistas_distribuidores_fundo,
SAFE_CAST(quantidade_clientes_cotistas_outros_tipos AS INT64) quantidade_clientes_cotistas_outros_tipos,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotitstas_pessoa_fisica_private_banking AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotitstas_pessoa_fisica_private_banking,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotitstas_pessoa_fisica_varejo AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotitstas_pessoa_fisica_varejo,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_pessoa_juridica_nao_financeira_private_banking AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_pessoa_juridica_nao_financeira_private_banking,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_pessoa_juridica_nao_financeira_varejo AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_pessoa_juridica_nao_financeira_varejo,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotitstas_banco_comercial AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotitstas_banco_comercial,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_corretora_distribuidora AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_corretora_distribuidora,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_outras_pessoas_juridicas_financeiras AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_outras_pessoas_juridicas_financeiras,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_investidores_nao_residentes AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_investidores_nao_residentes,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_entidade_aberta_previdencia_complementar AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_entidade_aberta_previdencia_complementar,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_entidade_fechada_previdencia_complementar AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_entidade_fechada_previdencia_complementar,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_regime_proprio_previdencia_servidores_publicos AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_regime_proprio_previdencia_servidores_publicos,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_sociedade_seguradora_resseguradora AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_sociedade_seguradora_resseguradora,
SAFE_CAST(porcentagem_patrimonio_liquido_detido_cotistas_sociedade_capitalizacao_arrendamento_mercantil AS FLOAT64) porcentagem_patrimonio_liquido_detido_cotistas_sociedade_capitalizacao_arrendamento_mercantil,
SAFE_CAST(porcentagem_patrimonio_liquido_cotistas_fundos_clubes_investimento AS FLOAT64) porcentagem_patrimonio_liquido_cotistas_fundos_clubes_investimento,
SAFE_CAST(porcentagem_patrimonio_liquido_cotistas_distribuidores_fundo AS FLOAT64) porcentagem_patrimonio_liquido_cotistas_distribuidores_fundo,
SAFE_CAST(porcentagem_patrimonio_liquido_cotistas_outros_tipos AS FLOAT64) porcentagem_patrimonio_liquido_cotistas_outros_tipos,
SAFE_CAST(resumo_voto_adminstrador_assembleia AS STRING) resumo_voto_adminstrador_assembleia,
SAFE_CAST(justificativa_voto_administrador_assembleia AS STRING) justificativa_voto_administrador_assembleia,
SAFE_CAST(porcentagem_valor_em_risco_carteria AS FLOAT64) porcentagem_valor_em_risco_carteria,
SAFE_CAST(tipo_modelos_valor_em_risco AS STRING) tipo_modelos_valor_em_risco,
SAFE_CAST(prazo_carteira_titulos AS FLOAT64) prazo_carteira_titulos,
SAFE_CAST(resumo_deliberacoes_aprovadas_assembleia AS STRING) resumo_deliberacoes_aprovadas_assembleia,
SAFE_CAST(valor_total_contrato_compra_dolar AS FLOAT64) valor_total_contrato_compra_dolar,
SAFE_CAST(valor_total_contrato_venda_dolar AS FLOAT64) valor_total_contrato_venda_dolar,
SAFE_CAST(porcentagem_variacao_diaria_valor_cota AS FLOAT64) porcentagem_variacao_diaria_valor_cota,
SAFE_CAST(fator_primitivo_risco AS STRING) fator_primitivo_risco,
SAFE_CAST(cenario_fator_primitivo_risco_ibovespa AS STRING) cenario_fator_primitivo_risco_ibovespa,
SAFE_CAST(cenario_fator_primitivo_risco_juros AS STRING) cenario_fator_primitivo_risco_juros,
SAFE_CAST(cenario_fator_primitivo_cupom_cambial AS STRING) cenario_fator_primitivo_cupom_cambial,
SAFE_CAST(cenario_fator_primitivo_dolar AS STRING) cenario_fator_primitivo_dolar,
SAFE_CAST(cenario_fator_primitivo_outros AS STRING) cenario_fator_primitivo_outros,
SAFE_CAST(porcentagem_variacao_diaria_cota_estresse AS FLOAT64) porcentagem_variacao_diaria_cota_estresse,
SAFE_CAST(porcentagem_variacao_diaria_patrimonio_liquido_taxa_anual_juros AS FLOAT64) porcentagem_variacao_diaria_patrimonio_liquido_taxa_anual_juros,
SAFE_CAST(porcentagem_variacao_diaria_patrimonio_liquido_taxa_cambio AS FLOAT64) porcentagem_variacao_diaria_patrimonio_liquido_taxa_cambio,
SAFE_CAST(porcentagem_variacao_diaria_patrimonio_liquido_ibovespa AS FLOAT64) porcentagem_variacao_diaria_patrimonio_liquido_ibovespa,
SAFE_CAST(fator_risco_outros AS STRING) fator_risco_outros,
SAFE_CAST(porcentagem_variacao_diaria_patrimonio_liquido_outros AS FLOAT64) porcentagem_variacao_diaria_patrimonio_liquido_outros,
SAFE_CAST(porcentagem_valor_colateral_garantia_derivativos AS FLOAT64) porcentagem_valor_colateral_garantia_derivativos,
SAFE_CAST(fator_risco_nocional AS STRING) fator_risco_nocional,
SAFE_CAST(valor_fator_risco_nocional_long_ibovespa AS FLOAT64) valor_fator_risco_nocional_long_ibovespa,
SAFE_CAST(valor_fator_risco_nocional_long_juros AS FLOAT64) valor_fator_risco_nocional_long_juros,
SAFE_CAST(valor_fator_risco_nocional_long_cupom AS FLOAT64) valor_fator_risco_nocional_long_cupom,
SAFE_CAST(valor_fator_risco_nocional_long_dolar AS FLOAT64) valor_fator_risco_nocional_long_dolar,
SAFE_CAST(valor_fator_risco_nocional_long_outro AS FLOAT64) valor_fator_risco_nocional_long_outro,
SAFE_CAST(valor_fator_risco_nocional_short_ibovespa AS FLOAT64) valor_fator_risco_nocional_short_ibovespa,
SAFE_CAST(valor_fator_risco_nocional_short_juros AS FLOAT64) valor_fator_risco_nocional_short_juros,
SAFE_CAST(valor_fator_risco_nocional_short_cupom AS FLOAT64) valor_fator_risco_nocional_short_cupom,
SAFE_CAST(valor_fator_risco_nocional_short_dolar AS FLOAT64) valor_fator_risco_nocional_short_dolar,
SAFE_CAST(valor_fator_risco_nocional_short_outro AS FLOAT64) valor_fator_risco_nocional_short_outro,
SAFE_CAST(tipo_pessoa_comitente_1 AS STRING) tipo_pessoa_comitente_1,
SAFE_CAST(cpf_cnpj_comitente_1 AS STRING) cpf_cnpj_comitente_1,
SAFE_CAST(indicador_comitente_relacionada_administrador_gestor_1 AS INT64) indicador_comitente_relacionada_administrador_gestor_1,
SAFE_CAST(porcentagem_valor_parte_comitente_1 AS FLOAT64) porcentagem_valor_parte_comitente_1,
SAFE_CAST(tipo_pessoa_comitente_2 AS STRING) tipo_pessoa_comitente_2,
SAFE_CAST(cpf_cnpj_comitente_2 AS STRING) cpf_cnpj_comitente_2,
SAFE_CAST(indicador_comitente_relacionada_administrador_gestor_2 AS INT64) indicador_comitente_relacionada_administrador_gestor_2,
SAFE_CAST(porcentagem_valor_parte_comitente_2 AS FLOAT64) porcentagem_valor_parte_comitente_2,
SAFE_CAST(tipo_pessoa_comitente_3 AS STRING) tipo_pessoa_comitente_3,
SAFE_CAST(cpf_cnpj_comitente_3 AS STRING) cpf_cnpj_comitente_3,
SAFE_CAST(indicador_comitente_relacionada_administrador_gestor_3 AS INT64) indicador_comitente_relacionada_administrador_gestor_3,
SAFE_CAST(porcentagem_valor_parte_comitente_3 AS FLOAT64) porcentagem_valor_parte_comitente_3,
SAFE_CAST(porcentagem_valor_total_ativos_emissao_partes_relacionadas AS FLOAT64) porcentagem_valor_total_ativos_emissao_partes_relacionadas,
SAFE_CAST(tipo_pessoa_emissor_1 AS STRING) tipo_pessoa_emissor_1,
SAFE_CAST(cpf_cnpj_emissor_1 AS STRING) cpf_cnpj_emissor_1,
SAFE_CAST(indicador_emissor_relacionada_administrador_gestor_1 AS INT64) indicador_emissor_relacionada_administrador_gestor_1,
SAFE_CAST(porcentagem_valor_parte_emissor_1 AS FLOAT64) porcentagem_valor_parte_emissor_1,
SAFE_CAST(tipo_pessoa_emissor_2 AS STRING) tipo_pessoa_emissor_2,
SAFE_CAST(cpf_cnpj_emissor_2 AS STRING) cpf_cnpj_emissor_2,
SAFE_CAST(indicador_emissor_relacionada_administrador_gestor_2 AS INT64) indicador_emissor_relacionada_administrador_gestor_2,
SAFE_CAST(porcentagem_valor_parte_emissor_2 AS FLOAT64) porcentagem_valor_parte_emissor_2,
SAFE_CAST(tipo_pessoa_emissor_3 AS STRING) tipo_pessoa_emissor_3,
SAFE_CAST(cpf_cnpj_emissor_3 AS STRING) cpf_cnpj_emissor_3,
SAFE_CAST(indicador_emissor_relacionada_administrador_gestor_3 AS INT64) indicador_emissor_relacionada_administrador_gestor_3,
SAFE_CAST(porcentagem_valor_parte_emissor_3 AS FLOAT64) porcentagem_valor_parte_emissor_3,
SAFE_CAST(porcentagem_valor_total_ativos_credito_privado AS FLOAT64) porcentagem_valor_total_ativos_credito_privado,
SAFE_CAST(indicador_vedada_cobranca_taxa_performance AS INT64) indicador_vedada_cobranca_taxa_performance,
SAFE_CAST(data_cota_fundo_ultima_cobranca_taxa_performance AS DATE) data_cota_fundo_ultima_cobranca_taxa_performance,
SAFE_CAST(valor_cota_fundo_ultima_cobranca_taxa_performance AS FLOAT64) valor_cota_fundo_ultima_cobranca_taxa_performance,
SAFE_CAST(valor_distribuido_direito_dividendos_juros_capital_proprio_outros AS FLOAT64) valor_distribuido_direito_dividendos_juros_capital_proprio_outros,
SAFE_CAST(quantidade_cotistas_entidade_previdencia_complementar AS INT64) quantidade_cotistas_entidade_previdencia_complementar,
SAFE_CAST(porcentagem_cotistas_entidade_previdencia_complementar AS FLOAT64) porcentagem_cotistas_entidade_previdencia_complementar,
SAFE_CAST(porcentagem_patrimonio_liquido_maior_cotista AS FLOAT64) porcentagem_patrimonio_liquido_maior_cotista,
SAFE_CAST(quantidade_dias_cinquenta_percentual AS INT64) quantidade_dias_cinquenta_percentual,
SAFE_CAST(quantidade_dias_cem_percentual AS INT64) quantidade_dias_cem_percentual,
SAFE_CAST(indicador_liquidez AS INT64) indicador_liquidez,
SAFE_CAST(porcentagem_patrimonio_liquido_convertido_caixa AS FLOAT64) porcentagem_patrimonio_liquido_convertido_caixa,
FROM basedosdados-dev.br_cvm_fi_staging.documentos_perfil_mensal AS t

