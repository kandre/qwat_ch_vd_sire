-- View: qwat_ch_vd_sire.station_pompage

-- DROP VIEW qwat_ch_vd_sire.station_pompage;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.station_pompage AS 
 SELECT vw_export_installation.id AS "ID_Num",
    vw_export_installation.qwat_ext_ch_vd_sire_remarque || vw_export_installation.remark AS "Remarque",
    NULL::date AS "Date_de_saisie",
    NULL::date AS "Dern_M_a_J",
    vw_export_installation.precision_code_sire AS "Precision_Geo",
    vw_export_installation.fk_distributor AS "ID_Distributeur",
    vw_export_installation.qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_exploitation",
    vw_export_installation.year AS "Annee_Construction",
    NULL::text AS "Nom_descriptif",
    vw_export_installation.folder_identification AS "Numero_dossier",
    vw_export_installation.fk_pressurezone AS "ID_Zone_pression",
    vw_export_installation.watertype_code_sire AS "Type_eau",
    vw_export_installation.pump_type_code_sire AS "Genre",
    vw_export_installation.altitude AS "Altitude",
    vw_export_installation.rejected_flow AS "Q_Max_Refoule",
    vw_export_installation.no_pumps AS "Nombre_Pompes",
    vw_export_installation.manometric_height AS "H_Manometrique",
    vw_export_installation.pump_operating_code_sire AS "Fonctionnement",
    vw_export_installation.qwat_ext_ch_vd_sire_adesafecter AS "A_Desafecter_PDDE",
    st_force2d(vw_export_installation.geometry) AS geometry
   FROM qwat_od.vw_export_installation
  WHERE vw_export_installation.installation_type = 'pump'::qwat_od.installation_type AND (vw_export_installation.status_functional IS TRUE OR vw_export_installation.fk_status = 1306);

ALTER TABLE qwat_ch_vd_sire.station_pompage
  OWNER TO postgres;

