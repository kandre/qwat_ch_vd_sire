-- View: qwat_ch_vd_sire.conduite

-- DROP VIEW qwat_ch_vd_sire.conduite;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.conduite AS 
 SELECT vw_export_pipe2.id AS "ID_Num",
    vw_export_pipe2.qwat_ext_ch_vd_sire_remarque || vw_export_pipe2.remark AS "Remarque",
    NULL AS "Date_de_saisie",
    NULL AS "Dern_M_a_J",
    vw_export_pipe2.precision_code_sire AS "Precision_Geo",
    vw_export_pipe2.fk_distributor AS "ID_Distributeur",
    vw_export_pipe2.qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_exploitation",
    vw_export_pipe2.year AS "Annee_Construction",
    NULL::text AS "Nom_descriptif",
    vw_export_pipe2.folder_identification AS "Numero_dossier",
    vw_export_pipe2.fk_pressurezone AS "ID_Zone_pression",
    vw_export_pipe2.watertype_code_sire AS "Type_eau",
    vw_export_pipe2.pipe_function_code_sire AS "Fonction",
    vw_export_pipe2.pipe_material_code_sire AS "Materiau",
    vw_export_pipe2.pipe_material_diameter_external AS "Diametre_Externe",
    vw_export_pipe2.qwat_ext_ch_vd_sire_diametre AS "Diam_int_PDDE",
    vw_export_pipe2.pipe_material_diameter_internal AS "Diametre_Interne",
    vw_export_pipe2.year_rehabilitation AS "Annee_Rehabilitation",
    vw_export_pipe2.pipe_material_pressure_nominal AS "Pression_fonc_admise",
    NULL::double precision AS "Rugosite_Hydraulique",
    st_length(vw_export_pipe2.geometry) AS "Longueur_reelle",
    2 AS "Calcul_Hydraulique",
    vw_export_pipe2.qwat_ext_ch_vd_sire_adesafecter AS "A_Desafecter_PDDE",
    st_force2d(vw_export_pipe2.geometry) AS geometry
   FROM temp.vw_export_pipe2
  WHERE vw_export_pipe2.pipe_function_major IS TRUE AND (vw_export_pipe2.status_functional is TRUE OR vw_export_pipe2.fk_status=1306);

ALTER TABLE qwat_ch_vd_sire.conduite
  OWNER TO postgres;

