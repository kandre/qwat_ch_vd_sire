-- View: qwat_ch_vd_sire.regulation_pression

-- DROP VIEW qwat_ch_vd_sire.regulation_pression;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.regulation_pression AS 
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
        CASE
            WHEN vw_export_installation2.installation_type = 'pump'::qwat_od.installation_type THEN 2
            ELSE 0
        END AS "Genre",
    vw_export_installation2.altitude AS "Altitude",
    1 AS "Etat_Connexion",
    NULL::text AS "ID_Distributeur_2",
    NULL::text AS "ID_Zone_pression_2",
    0 AS "Type_Regulation",
    NULL::double precision AS "Valeur_Consigne_reg",
    2 AS "Telecommande_incendie",
    NULL::integer AS "ID_Centrale_exploitation",
    vw_export_installation2.remote_code_sire AS "Type_transmission",
    vw_export_installation2.qwat_ext_ch_vd_sire_adesafecter AS "A_Desafecter_PDDE",
    st_force2d(vw_export_installation2.geometry) AS geometry
   FROM temp.vw_export_installation2
  WHERE (vw_export_installation2.fk_pressurecontrol_type = ANY (ARRAY[2801, 2802])) AND (vw_export_installation2.status_functional IS TRUE OR vw_export_installation2.fk_status = 1306)
UNION
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
    vw_export_valve.fk_pressurezone AS "ID_Zone_pression",
    1 AS "Type_eau",
    1 AS "Genre",
    vw_export_valve.altitude AS "Altitude",
    1 AS "Etat_Connexion",
    NULL::text AS "ID_Distributeur_2",
    NULL::text AS "ID_Zone_pression_2",
    0 AS "Type_Regulation",
    NULL::double precision AS "Valeur_Consigne_reg",
    2 AS "Telecommande_incendie",
    NULL::integer AS "ID_Centrale_exploitation",
        CASE
            WHEN vw_export_valve.fk_valve_actuation = 6404 THEN 6
            ELSE 0
        END AS "Type_transmission",
    vw_export_valve.qwat_ext_ch_vd_sire_adesafecter AS "A_Desafecter_PDDE",
    st_force2d(vw_export_valve.geometry) AS geometry
   FROM qwat_od.vw_export_valve
  WHERE vw_export_valve.fk_valve_function = 6101 AND (vw_export_valve.status_functional IS TRUE OR vw_export_valve.fk_status = 1306);

ALTER TABLE qwat_ch_vd_sire.regulation_pression
  OWNER TO postgres;

