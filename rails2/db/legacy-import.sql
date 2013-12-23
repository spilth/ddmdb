-- Clean out current entries and import from legacy database

TRUNCATE ddmdb_development.releases;
INSERT INTO ddmdb_development.releases (SELECT ddm_set_id, ddm_set_name, ddm_set_short_name, NOW(), NULL from ddmdb_legacy.ddm_set);

TRUNCATE ddmdb_development.sizes;
INSERT INTO ddmdb_development.sizes (SELECT ddm_size_id, ddm_size_name, ddm_size_abbreviation, NOW(), NULL FROM ddmdb_legacy.ddm_size);

TRUNCATE ddmdb_development.rarities;
INSERT INTO ddmdb_development.rarities (SELECT ddm_rarity_id, ddm_rarity_name, ddm_rarity_letter, NOW(), NULL FROM ddmdb_legacy.ddm_rarity);

TRUNCATE ddmdb_development.types;
INSERT INTO ddmdb_development.types (SELECT ddm_type_id, ddm_type_name, NOW(), NULL FROM ddmdb_legacy.ddm_type);

TRUNCATE ddmdb_development.subtypes;
INSERT INTO ddmdb_development.subtypes (SELECT ddm_subtype_id, ddm_subtype_name, NOW(), NULL FROM ddmdb_legacy.ddm_subtype);

TRUNCATE ddmdb_development.sources;
INSERT INTO ddmdb_development.sources (SELECT ddm_source_id, ddm_source_name, ddm_source_short_name, NOW(), NULL FROM ddmdb_legacy.ddm_source);

TRUNCATE ddmdb_development.settings;
INSERT INTO ddmdb_development.settings (SELECT ddm_setting_id, ddm_setting_name, NULL, NOW(), NULL FROM ddmdb_legacy.ddm_setting);

TRUNCATE ddmdb_development.miniatures;
INSERT INTO ddmdb_development.miniatures (SELECT ddm_mini_id, ddm_mini_name, ddm_mini_number, ddm_set_id, ddm_type_id, ddm_subtype_id, ddm_source_id, ddm_source_page, ddm_setting_id, ddm_mini_cr, NOW(), NULL, ddm_size_id, ddm_rarity_id FROM ddmdb_legacy.ddm_mini);
