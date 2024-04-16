{{
    config(
        alias="garantia_safra",
        schema="br_cgu_beneficios_cidadao",
        materialized="incremental",
        partition_by={
            "field": "ano_referencia",
            "data_type": "int64",
            "range": {
                "start": 2013,
                "end": 2024,
                "interval": 1,
            },
        },
        cluster_by=["mes_referencia", "sigla_uf"],
        pre_hook="DROP ALL ROW ACCESS POLICIES ON {{ this }}",
        post_hook=[
            'CREATE OR REPLACE ROW ACCESS POLICY allusers_filter ON {{this}} GRANT TO ("allUsers") FILTER USING (DATE_DIFF(DATE("{{ run_started_at.strftime("%Y-%m-%d") }}"),DATE(CAST(ano_referencia AS INT64),CAST(mes_referencia AS INT64),1), MONTH) > 6)',
            'CREATE OR REPLACE ROW ACCESS POLICY bdpro_filter ON {{this}} GRANT TO ("group:bd-pro@basedosdados.org", "group:sudo@basedosdados.org") FILTER USING (DATE_DIFF(DATE("{{ run_started_at.strftime("%Y-%m-%d") }}"),DATE(CAST(ano_referencia AS INT64),CAST(mes_referencia AS INT64),1), MONTH) <= 6)',
        ],
    )
}}

select
    safe_cast(substr(mes_referencia, 1, 4) as int64) ano_referencia,
    safe_cast(substr(mes_referencia, 5, 2) as int64) mes_referencia,
    t2.id_municipio,
    safe_cast(t1.sigla_uf as string) sigla_uf,
    safe_cast(nis as string) nis_favorecido,
    safe_cast(t1.nome as string) nome_favorecido,
    safe_cast(valor as float64) valor_parcela,
from `basedosdados-staging.br_cgu_beneficios_cidadao_staging.garantia_safra` t1
left join
    `basedosdados.br_bd_diretorios_brasil.municipio` t2
    on safe_cast(t1.id_municipio_siafi as int64)
    = safe_cast(t2.id_municipio_rf as int64)
{% if is_incremental() %}
    where
        safe_cast(parse_date('%Y%m', mes_referencia) as date) > (
            select
                max(
                    safe_cast(
                        parse_date(
                            '%Y%m',
                            concat(
                                cast(ano_referencia as string),
                                lpad(cast(mes_referencia as string), 2, '0')
                            )
                        ) as date
                    )
                )
            from {{ this }}
        )
{% endif %}
