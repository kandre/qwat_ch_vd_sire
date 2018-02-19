-- View: qwat_ch_vd_sire.station_traitement

-- DROP VIEW qwat_ch_vd_sire.station_traitement;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.station_traitement AS 
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
        CASE
            WHEN vw_export_installation.sanitization_uv IS TRUE THEN 1
            ELSE 0
        END AS "UV_rayon_Desinfection",
        CASE
            WHEN vw_export_installation.sanitization_chlorine_liquid IS TRUE THEN 1
            ELSE 0
        END AS "Chlore_liquide_Desinfection",
        CASE
            WHEN vw_export_installation.sanitization_chlorine_gazeous IS TRUE THEN 1
            ELSE 0
        END AS "Chlore_gazeux_Desinfection",
        CASE
            WHEN vw_export_installation.sanitization_ozone IS TRUE THEN 1
            ELSE 0
        END AS "Ozone_Desinfection",
        CASE
            WHEN vw_export_installation.filtration_membrane IS TRUE THEN 1
            ELSE 0
        END AS "Membrane_Filtration",
        CASE
            WHEN vw_export_installation.filtration_sandorgravel IS TRUE THEN 1
            ELSE 0
        END AS "Sable_ou_gravier_Filtration",
        CASE
            WHEN vw_export_installation.flocculation IS TRUE THEN 1
            ELSE 0
        END AS "Floculation",
        CASE
            WHEN vw_export_installation.activatedcharcoal IS TRUE THEN 1
            ELSE 0
        END AS "Charbon_actif_Filtration",
        CASE
            WHEN vw_export_installation.settling IS TRUE THEN 1
            ELSE 0
        END AS "Decantation",
    vw_export_installation.treatment_capacity AS "Capacite_traitement",
    2 AS "Electricite_pour_fonctionnement",
    vw_export_installation.qwat_ext_ch_vd_sire_adesafecter AS "A_Desafecter_PDDE",
    st_force2d(vw_export_installation.geometry) AS geometry
   FROM qwat_od.vw_export_installation
  WHERE vw_export_installation.installation_type = 'treatment'::qwat_od.installation_type AND (vw_export_installation.status_functional IS TRUE OR vw_export_installation.fk_status = 1306);

ALTER TABLE qwat_ch_vd_sire.station_traitement
  OWNER TO postgres;

