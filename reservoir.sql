-- View: qwat_ch_vd_sire.reservoir

-- DROP VIEW qwat_ch_vd_sire.reservoir;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.reservoir AS 
 SELECT vw_export_installation2.id AS id_num,
    vw_export_installation2.qwat_ext_ch_vd_sire_remarque || vw_export_installation2.remark AS remarque,
    NULL::unknown AS date_de_saisie,
    NULL::unknown AS dern_m_a_j,
    vw_export_installation2.precision_code_sire AS precision_geo,
    vw_export_installation2.fk_distributor AS id_distributeur,
    vw_export_installation2.qwat_ext_ch_vd_sire_etat_exploitation AS etat_exploitation,
    vw_export_installation2.year AS annee_construction,
    NULL::text AS nom_descriptif,
    vw_export_installation2.folder_identification AS numero_dossier,
    vw_export_installation2.fk_pressurezone AS id_zone_pression,
    vw_export_installation2.watertype_code_sire AS type_eau,
    vw_export_installation2.storage_total AS capacite_stockage,
    vw_export_installation2.storage_supply AS reserve_alimentation,
    vw_export_installation2.storage_fire AS reserve_incendie,
        CASE
            WHEN vw_export_installation2.cistern1_dimension_1 > 0::numeric THEN 1
            ELSE 0
        END +
        CASE
            WHEN vw_export_installation2.cistern2_dimension_1 > 0::numeric THEN 1
            ELSE 0
        END AS nombre_cuves,
    vw_export_installation2.altitude_overflow AS altitude_trop_plein,
    vw_export_installation2.altitude_apron AS altitude_radier,
        CASE
            WHEN vw_export_installation2.fire_valve IS TRUE THEN 1
            ELSE 0
        END AS vanne_incendie,
        CASE
            WHEN vw_export_installation2.fire_remote IS TRUE THEN 1
            ELSE 0
        END AS telecommande_incendie,
    NULL::unknown AS id_centrale_exploitation,
    vw_export_installation2.remote_code_sire AS type_transmission,
    vw_export_installation2.qwat_ext_ch_vd_sire_adesafecter AS a_desafecter_pdde,
    st_force2d(vw_export_installation2.geometry) AS geometry
   FROM temp.vw_export_installation2
  WHERE vw_export_installation2.installation_type = 'tank'::qwat_od.installation_type;

ALTER TABLE qwat_ch_vd_sire.reservoir
  OWNER TO postgres;

