-- View: qwat_ch_vd_sire.vanne_clapet

-- DROP VIEW qwat_ch_vd_sire.vanne_clapet;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.vanne_clapet AS 
 SELECT vw_export_valve.id AS id_num,
    vw_export_valve.qwat_ext_ch_vd_sire_remarque || vw_export_valve.remark AS remarque,
    NULL::unknown AS date_de_saisie,
    NULL::unknown AS dern_m_a_j,
    vw_export_valve.precision_code_sire AS precision_geo,
    vw_export_valve.fk_distributor AS id_distributeur,
    vw_export_valve.qwat_ext_ch_vd_sire_etat_exploitation AS etat_exploitation,
    vw_export_valve.year AS annee_construction,
    NULL::text AS nom_descriptif,
    vw_export_valve.folder_identification AS numero_dossier,
    vw_export_valve.fk_pressurezone AS id_zone_pression,
    1 AS type_eau,
        CASE
            WHEN vw_export_valve.fk_valve_function = 6107 THEN 0
            WHEN vw_export_valve.fk_valve_type = 6307 THEN 3
            ELSE 1
        END AS genre,
        CASE
            WHEN vw_export_valve.closed IS TRUE THEN 3
            WHEN vw_export_valve.fk_valve_type = 6307 THEN 0
            WHEN vw_export_valve.closed IS FALSE THEN 2
            ELSE 1
        END AS etat_de_la_connexion,
    vw_export_valve.altitude,
    NULL::unknown AS id_distributeur_2,
    NULL::unknown AS id_zone_pression_2,
        CASE
            WHEN vw_export_valve.fk_valve_function = 6107 AND vw_export_valve.fk_valve_actuation = 6404 THEN 1
            ELSE 0
        END AS telecommande_incendie,
    NULL::unknown AS id_centrale_exploitation,
    6 AS type_transmission,
    st_force2d(vw_export_valve.geometry) AS geometry
   FROM qwat_od.vw_export_valve
  WHERE vw_export_valve.networkseparation IS TRUE OR vw_export_valve.fk_valve_function = 6107 OR vw_export_valve.fk_valve_type = 6307;

ALTER TABLE qwat_ch_vd_sire.vanne_clapet
  OWNER TO postgres;

