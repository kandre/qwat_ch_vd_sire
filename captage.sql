-- View: qwat_ch_vd_sire.captage

-- DROP VIEW qwat_ch_vd_sire.captage;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.captage AS 
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
    vw_export_installation.source_type_code_sire AS "Genre",
    vw_export_installation.flow_lowest AS "Q_etiage",
    vw_export_installation.flow_average AS "Q_moyen",
    vw_export_installation.source_quality_code_sire AS "Qualite_Captage",
    vw_export_installation.flow_concession AS "Q_Concession",
    vw_export_installation.contract_end AS "Date_fin_Concession",
        CASE
            WHEN vw_export_installation.gathering_chamber IS TRUE THEN 1
            WHEN vw_export_installation.gathering_chamber IS FALSE THEN 0
            ELSE 2
        END AS "Chambre_de_Rassemblement",
    NULL::integer AS "ID_Qualite",
    vw_export_installation.altitude AS "Altitude",
    vw_export_installation.qwat_ext_ch_vd_sire_adesafecter AS "A_Desafecter_PDDE",
    st_force2d(vw_export_installation.geometry) AS geometry
   FROM qwat_od.vw_export_installation
  WHERE vw_export_installation.installation_type = 'source'::qwat_od.installation_type AND (vw_export_installation.status_functional IS TRUE OR vw_export_installation.fk_status = 1306);

ALTER TABLE qwat_ch_vd_sire.captage
  OWNER TO postgres;

