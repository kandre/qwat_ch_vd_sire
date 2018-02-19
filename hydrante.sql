-- View: qwat_ch_vd_sire.hydrante

-- DROP VIEW qwat_ch_vd_sire.hydrante;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.hydrante AS 
 SELECT vw_export_hydrant.id AS id_num,
    vw_export_hydrant.qwat_ext_ch_vd_sire_remarque || vw_export_hydrant.remark AS remarque,
    NULL::unknown AS date_de_saisie,
    NULL::unknown AS dern_m_a_j,
    vw_export_hydrant.precision_code_sire AS precision_geo,
    vw_export_hydrant.fk_distributor AS id_distributeur,
    vw_export_hydrant.qwat_ext_ch_vd_sire_etat_exploitation AS etat_exploitation,
    vw_export_hydrant.year AS annee_construction,
    NULL::text AS nom_descriptif,
    vw_export_hydrant.folder_identification AS numero_dossier,
    vw_export_hydrant.fk_pressurezone AS id_zone_pression,
    1 AS type_eau,
        CASE
            WHEN vw_export_hydrant.underground IS TRUE THEN 0
            ELSE 1
        END AS genre,
    vw_export_hydrant.pressure_static AS pression_statique,
    vw_export_hydrant.pressure_dynamic AS pression_dyn_a,
    vw_export_hydrant.flow AS soustirage_a,
    vw_export_hydrant.observation_date AS calc_date,
    vw_export_hydrant.observation_source AS calc_source,
    NULL::unknown AS press_dyn_pdde,
    NULL::unknown AS soutirage_pdde,
    NULL::unknown AS sortie_storz,
    vw_export_hydrant.identification AS numero_bh,
    NULL::unknown AS zone_de_couverture,
    st_force2d(vw_export_hydrant.geometry) AS geometry
   FROM qwat_od.vw_export_hydrant;

ALTER TABLE qwat_ch_vd_sire.hydrante
  OWNER TO postgres;

