-- View: qwat_ch_vd_sire.hydrante

-- DROP VIEW qwat_ch_vd_sire.hydrante;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.hydrante AS 
 SELECT vw_export_hydrant.id AS "ID_Num",
    vw_export_hydrant.qwat_ext_ch_vd_sire_remarque || vw_export_hydrant.remark AS "Remarque",
    NULL::date AS "Date_de_saisie",
    NULL::date AS "Dern_M_a_J",
    vw_export_hydrant.precision_code_sire AS "Precision_Geo",
    vw_export_hydrant.fk_distributor AS "ID_Distributeur",
    vw_export_hydrant.qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_exploitation",
    vw_export_hydrant.year AS "Annee_Construction",
    NULL::text AS "Nom_descriptif",
    vw_export_hydrant.folder_identification AS "Numero_dossier",
    vw_export_hydrant.fk_pressurezone AS "ID_Zone_pression",
    1 AS "Type_eau",
        CASE
            WHEN vw_export_hydrant.underground IS TRUE THEN 0
            ELSE 1
        END AS "Genre",
    vw_export_hydrant.pressure_static AS "Pression_Statique",
    vw_export_hydrant.pressure_dynamic AS "Pression_Dyn_a",
    vw_export_hydrant.flow AS "Soustirage_a",
    vw_export_hydrant.observation_date AS "Calc_Date",
    vw_export_hydrant.observation_source AS "Calc_Source",
    NULL::double precision AS "Press_Dyn_PDDE",
    NULL::double precision AS "Soutirage_PDDE",
    NULL::text AS "Sortie_Storz",
    vw_export_hydrant.identification AS "Numero_BH",
    NULL::double precision AS "Zone_de_couverture",
    vw_export_hydrant.altitude AS "Altitude",
    st_force2d(vw_export_hydrant.geometry) AS geometry
   FROM qwat_od.vw_export_hydrant
   WHERE vw_export_hydrant.status_functional IS TRUE;

ALTER TABLE qwat_ch_vd_sire.hydrante
  OWNER TO postgres;

