-- View: qwat_ch_vd_sire.vanne_clapet

-- DROP VIEW qwat_ch_vd_sire.vanne_clapet;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.vanne_clapet AS 
 SELECT vw_export_valve.id AS "ID_Num",
    vw_export_valve.qwat_ext_ch_vd_sire_remarque || vw_export_valve.remark AS "Remarque",
    NULL::date AS "Date_de_saisie",
    NULL::date AS "Dern_M_a_J",
    vw_export_valve.precision_code_sire AS "Precision_Geo",
    vw_export_valve.fk_distributor AS "ID_Distributeur",
    vw_export_valve.qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_exploitation",
    vw_export_valve.year AS "Annee_Construction",
    NULL::text AS "Nom_descriptif",
    vw_export_valve.folder_identification AS "Numero_dossier",
    vw_export_valve.fk_pressurezone AS "ID_zone_pression",
    1 AS "Type_eau",
        CASE
            WHEN vw_export_valve.fk_valve_function = 6107 THEN 0
            WHEN vw_export_valve.fk_valve_type = 6307 THEN 3
            ELSE 1
        END AS "Genre",
        CASE
            WHEN vw_export_valve.closed IS TRUE THEN 3
            WHEN vw_export_valve.fk_valve_type = 6307 THEN 0
            WHEN vw_export_valve.closed IS FALSE THEN 2
            ELSE 1
        END AS "Etat_connexion",
    vw_export_valve.altitude AS "Altitude",
    NULL::int AS "ID_Distributeur_2",
    NULL::int AS "ID_Zone_pression_2",
        CASE
            WHEN vw_export_valve.fk_valve_function = 6107 AND vw_export_valve.fk_valve_actuation = 6404 THEN 1
            ELSE 0
        END AS "Telecommande_incendie",
    NULL::int AS "ID_Centrale_exploitation",
    6 AS "Type_transmission",
    st_force2d(vw_export_valve.geometry) AS geometry
   FROM qwat_od.vw_export_valve
  WHERE vw_export_valve.networkseparation IS TRUE OR vw_export_valve.fk_valve_function = 6107 OR vw_export_valve.fk_valve_type = 6307 AND (vw_export_valve.status_functional IS TRUE OR vw_export_valve.fk_status = 1306);

ALTER TABLE qwat_ch_vd_sire.vanne_clapet
  OWNER TO postgres;

