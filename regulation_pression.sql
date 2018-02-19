-- View: qwat_ch_vd_sire.regulation_pression

-- DROP VIEW qwat_ch_vd_sire.regulation_pression;

CREATE OR REPLACE VIEW qwat_ch_vd_sire.regulation_pression AS 
 SELECT vw_export_installation2.id AS id_num,
    vw_export_installation2.qwat_ext_ch_vd_sire_remarque || vw_export_installation2.remark AS remarque,
    NULL::text AS date_de_saisie,
    NULL::text AS dern_m_a_j,
    vw_export_installation2.precision_code_sire AS precision_geo,
    vw_export_installation2.fk_distributor AS id_distributeur,
    vw_export_installation2.qwat_ext_ch_vd_sire_etat_exploitation AS etat_exploitation,
    vw_export_installation2.year AS annee_construction,
    NULL::text AS nom_descriptif,
    vw_export_installation2.folder_identification AS numero_dossier,
    vw_export_installation2.fk_pressurezone AS id_zone_pression,
    vw_export_installation2.watertype_code_sire AS type_eau,
        CASE
            WHEN vw_export_installation2.installation_type = 'pump'::qwat_od.installation_type THEN 2
            ELSE 0
        END AS genre,
    vw_export_installation2.altitude,
    1 AS etat_connexion,
    NULL::text AS id_distributeur_2,
    NULL::text AS id_zone_pression_2,
    0 AS type_regulation,
    NULL::text AS valeur_consigne_reg,
    2 AS telecommande_incendie,
    NULL::text AS id_centrale_exploitation,
    vw_export_installation2.remote_code_sire AS type_transmission,
    vw_export_installation2.qwat_ext_ch_vd_sire_adesafecter AS a_desafecter_pdde,
    st_force2d(vw_export_installation2.geometry) AS geometry
   FROM temp.vw_export_installation2
  WHERE vw_export_installation2.fk_pressurecontrol_type = ANY (ARRAY[2801, 2802])
UNION
 SELECT vw_export_valve.id AS id_num,
    vw_export_valve.qwat_ext_ch_vd_sire_remarque || vw_export_valve.remark AS remarque,
    NULL::text AS date_de_saisie,
    NULL::text AS dern_m_a_j,
    vw_export_valve.precision_code_sire AS precision_geo,
    vw_export_valve.fk_distributor AS id_distributeur,
    vw_export_valve.qwat_ext_ch_vd_sire_etat_exploitation AS etat_exploitation,
    vw_export_valve.year AS annee_construction,
    NULL::text AS nom_descriptif,
    vw_export_valve.folder_identification AS numero_dossier,
    vw_export_valve.fk_pressurezone AS id_zone_pression,
    1 AS type_eau,
    1 AS genre,
    vw_export_valve.altitude,
    1 AS etat_connexion,
    NULL::text AS id_distributeur_2,
    NULL::text AS id_zone_pression_2,
    0 AS type_regulation,
    NULL::text AS valeur_consigne_reg,
    2 AS telecommande_incendie,
    NULL::text AS id_centrale_exploitation,
        CASE
            WHEN vw_export_valve.fk_valve_actuation = 6404 THEN 6
            ELSE 0
        END AS type_transmission,
    vw_export_valve.qwat_ext_ch_vd_sire_adesafecter AS a_desafecter_pdde,
    st_force2d(vw_export_valve.geometry) AS geometry
   FROM qwat_od.vw_export_valve
  WHERE vw_export_valve.fk_valve_function = 6101;

ALTER TABLE qwat_ch_vd_sire.regulation_pression
  OWNER TO postgres;

