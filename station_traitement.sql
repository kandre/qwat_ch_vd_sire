-- View: qwat_ch_vd_sire.station_traitement

-- DROP VIEW qwat_ch_vd_sire.station_traitement;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.station_traitement AS 
 SELECT vw_export_installation.id AS id_num,
    vw_export_installation.qwat_ext_ch_vd_sire_remarque || vw_export_installation.remark AS remarque,
    NULL::unknown AS date_de_saisie,
    NULL::unknown AS dern_m_a_j,
    vw_export_installation.precision_code_sire AS precision_geo,
    vw_export_installation.fk_distributor AS id_distributeur,
    vw_export_installation.qwat_ext_ch_vd_sire_etat_exploitation AS etat_exploitation,
    vw_export_installation.year AS annee_construction,
    NULL::text AS nom_descriptif,
    vw_export_installation.folder_identification AS numero_dossier,
    vw_export_installation.fk_pressurezone AS id_zone_pression,
    vw_export_installation.watertype_code_sire AS type_eau,
        CASE
            WHEN vw_export_installation.sanitization_uv IS TRUE THEN 1
            ELSE 0
        END AS uv_rayon_desinfection,
        CASE
            WHEN vw_export_installation.sanitization_chlorine_liquid IS TRUE THEN 1
            ELSE 0
        END AS chlore_liquide_desinfection,
        CASE
            WHEN vw_export_installation.sanitization_chlorine_gazeous IS TRUE THEN 1
            ELSE 0
        END AS chlore_gazeux_desinfection,
        CASE
            WHEN vw_export_installation.sanitization_ozone IS TRUE THEN 1
            ELSE 0
        END AS ozone_desinfection,
        CASE
            WHEN vw_export_installation.filtration_membrane IS TRUE THEN 1
            ELSE 0
        END AS membrane_filtration,
        CASE
            WHEN vw_export_installation.filtration_sandorgravel IS TRUE THEN 1
            ELSE 0
        END AS sable_ou_gravier_filtration,
        CASE
            WHEN vw_export_installation.flocculation IS TRUE THEN 1
            ELSE 0
        END AS floculation,
        CASE
            WHEN vw_export_installation.activatedcharcoal IS TRUE THEN 1
            ELSE 0
        END AS charbon_actif_filtration,
        CASE
            WHEN vw_export_installation.settling IS TRUE THEN 1
            ELSE 0
        END AS decantation,
    vw_export_installation.treatment_capacity AS capacite_traitement,
    2 AS electricite_pour_fonctionnement,
    vw_export_installation.qwat_ext_ch_vd_sire_adesafecter AS a_desafecter_pdde,
    st_force2d(vw_export_installation.geometry) AS geometry
   FROM qwat_od.vw_export_installation
  WHERE vw_export_installation.installation_type = 'treatment'::qwat_od.installation_type;

ALTER TABLE qwat_ch_vd_sire.station_traitement
  OWNER TO postgres;

