-- View: qwat_ch_vd_sire.captage

-- DROP VIEW qwat_ch_vd_sire.captage;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.captage AS 
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
    vw_export_installation.source_type_code_sire AS genre,
    vw_export_installation.flow_lowest AS q_etiage,
    vw_export_installation.flow_average AS q_moyen,
    vw_export_installation.source_quality_code_sire AS qualite_captage,
    vw_export_installation.flow_concession AS q_concession,
    vw_export_installation.contract_end AS date_fin_concession,
    vw_export_installation.gathering_chamber AS chambre_de_rassemblement,
    NULL::unknown AS id_qualite,
    vw_export_installation.altitude,
    vw_export_installation.qwat_ext_ch_vd_sire_adesafecter AS a_desafecter_pdde,
    st_force2d(vw_export_installation.geometry) AS geometry
   FROM qwat_od.vw_export_installation
  WHERE vw_export_installation.installation_type = 'source'::qwat_od.installation_type;

ALTER TABLE qwat_ch_vd_sire.captage
  OWNER TO postgres;

