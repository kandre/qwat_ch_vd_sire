-- View: qwat_ch_vd_sire.reservoir

 DROP VIEW qwat_ch_vd_sire.reservoir;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.reservoir AS 
 SELECT vw_export_installation2.id AS "ID_Num",
    vw_export_installation2.qwat_ext_ch_vd_sire_remarque || vw_export_installation2.remark AS "Remarque",
    NULL::date AS "Date_de_saisie",
    NULL::date AS "Dern_M_a_J",
    vw_export_installation2.precision_code_sire AS "Precision_Geo",
    vw_export_installation2.fk_distributor AS "ID_Distributeur",
    vw_export_installation2.qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_exploitation",
    vw_export_installation2.year AS "Annee_Construction",
    NULL::text AS "Nom_descriptif",
    vw_export_installation2.folder_identification AS "Numero_dossier",
    vw_export_installation2.fk_pressurezone AS "ID_Zone_pression",
    vw_export_installation2.watertype_code_sire AS "Type_eau",
    vw_export_installation2.storage_total AS "Capacite_Stockage",
    vw_export_installation2.storage_supply AS "Reserve_Alimentation",
    vw_export_installation2.storage_fire AS "Reserve_incendie",
        CASE
            WHEN vw_export_installation2.cistern1_dimension_1 > 0::numeric THEN 1
            ELSE 0
        END +
        CASE
            WHEN vw_export_installation2.cistern2_dimension_1 > 0::numeric THEN 1
            ELSE 0
        END AS "Nombre_Cuves",
    vw_export_installation2.altitude_overflow AS "Altitude_trop_plein",
    vw_export_installation2.altitude_apron AS "Altitude_radier",
        CASE
            WHEN vw_export_installation2.fire_valve IS TRUE THEN 1
            ELSE 0
        END AS "Vanne_incendie",
        CASE
            WHEN vw_export_installation2.fire_remote IS TRUE THEN 1
            ELSE 0
        END AS "Telecommande_incendie",
    NULL::integer AS "ID_Centrale_exploitation",
    vw_export_installation2.remote_code_sire AS "Type_transmission",
    vw_export_installation2.qwat_ext_ch_vd_sire_adesafecter AS "A_Desafecter_PDDE",
    st_force2d(vw_export_installation2.geometry) AS geometry
   FROM temp.vw_export_installation2
  WHERE vw_export_installation2.installation_type = 'tank'::qwat_od.installation_type AND (vw_export_installation2.status_functional IS TRUE OR vw_export_installation2.fk_status = 1306);

ALTER TABLE qwat_ch_vd_sire.reservoir
  OWNER TO postgres;

