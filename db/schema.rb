# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180424145540) do

  create_table "acs_sets", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "stix_id",             limit: 255
    t.string   "guid",                limit: 255
    t.integer  "old_acs_sets_org_id", limit: 4
    t.string   "color",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",                          default: false
    t.string   "portion_marking",     limit: 255
    t.string   "acs_sets_org_id",     limit: 255
    t.boolean  "transfer_from_low",               default: false
  end

  create_table "acs_sets_organizations", force: :cascade do |t|
    t.integer  "old_organization_id", limit: 4
    t.integer  "old_acs_set_id",      limit: 4
    t.string   "guid",                limit: 255
    t.datetime "updated_at"
    t.string   "organization_id",     limit: 255
    t.string   "acs_set_id",          limit: 255
    t.boolean  "transfer_from_low",               default: false
  end

  create_table "ais_consent_marking_structures", force: :cascade do |t|
    t.string   "consent",           limit: 255
    t.boolean  "proprietary"
    t.string   "color",             limit: 255
    t.string   "stix_id",           limit: 255
    t.string   "stix_marking_id",   limit: 255
    t.string   "guid",              limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",             default: false
  end

  create_table "ais_statistics", force: :cascade do |t|
    t.string   "stix_package_stix_id",     limit: 255
    t.string   "stix_package_original_id", limit: 255
    t.string   "uploaded_file_id",         limit: 255
    t.string   "feeds",                    limit: 255
    t.string   "messages",                 limit: 255
    t.string   "ais_uid",                  limit: 255
    t.string   "guid",                     limit: 255
    t.integer  "indicator_amount",         limit: 4
    t.boolean  "flare_in_status"
    t.boolean  "ciap_status"
    t.boolean  "ecis_status"
    t.boolean  "flare_out_status"
    t.boolean  "ecis_status_hr"
    t.boolean  "flare_out_status_hr"
    t.datetime "dissemination_time"
    t.datetime "dissemination_time_hr"
    t.datetime "received_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ais_statistics", ["ais_uid"], name: "index_ais_statistics_on_ais_uid", using: :btree
  add_index "ais_statistics", ["guid"], name: "index_ais_statistics_on_guid", using: :btree
  add_index "ais_statistics", ["updated_at"], name: "index_ais_statistics_on_updated_at", using: :btree

  create_table "api_logs", force: :cascade do |t|
    t.string   "action",              limit: 255
    t.string   "controller",          limit: 255
    t.text     "uri",                 limit: 65535
    t.string   "user_guid",           limit: 255
    t.integer  "count",               limit: 4
    t.string   "query_source_entity", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attack_patterns", force: :cascade do |t|
    t.string   "stix_id",                      limit: 255
    t.string   "title",                        limit: 255
    t.string   "title_c",                      limit: 255
    t.text     "description",                  limit: 65535
    t.string   "description_c",                limit: 255
    t.string   "description_normalized",       limit: 255
    t.string   "capec_id",                     limit: 255
    t.string   "capec_id_c",                   limit: 255
    t.string   "portion_marking",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                         limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.datetime "stix_timestamp"
    t.boolean  "read_only",                                  default: false
    t.boolean  "is_mifr",                                    default: false
    t.boolean  "is_ciscp",                                   default: false
    t.string   "feeds",                        limit: 255
  end

  add_index "attack_patterns", ["capec_id"], name: "index_attack_patterns_on_capec_id", using: :btree
  add_index "attack_patterns", ["description_normalized"], name: "index_attack_patterns_on_description_normalized", using: :btree
  add_index "attack_patterns", ["guid"], name: "index_attack_patterns_on_guid", using: :btree
  add_index "attack_patterns", ["stix_id"], name: "index_attack_patterns_on_stix_id", using: :btree
  add_index "attack_patterns", ["title"], name: "index_attack_patterns_on_title", using: :btree
  add_index "attack_patterns", ["updated_at"], name: "index_attack_patterns_on_updated_at", using: :btree

  create_table "audit_logs", force: :cascade do |t|
    t.string   "message",           limit: 255
    t.text     "details",           limit: 65535
    t.string   "audit_type",        limit: 255
    t.string   "old_justification", limit: 255
    t.datetime "event_time"
    t.string   "user_guid",         limit: 255
    t.string   "system_guid",       limit: 255
    t.string   "item_type_audited", limit: 255
    t.string   "item_guid_audited", limit: 255
    t.string   "guid",              limit: 255
    t.string   "audit_subtype",     limit: 255
    t.text     "justification",     limit: 65535
  end

  add_index "audit_logs", ["item_type_audited", "item_guid_audited"], name: "index_audit_logs_on_item_type_audited_and_item_guid_audited", using: :btree

  create_table "authentication_logs", force: :cascade do |t|
    t.text     "info",        limit: 65535
    t.string   "event",       limit: 255
    t.string   "access_mode", limit: 255
    t.string   "user_guid",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remote_ip",   limit: 255
  end

  create_table "avp_messages", force: :cascade do |t|
    t.text     "prohibited", limit: 65535
    t.text     "avp_errors", limit: 65535
    t.string   "guid",       limit: 255
    t.boolean  "avp_valid"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "avp_messages", ["guid"], name: "index_avp_messages_on_guid", using: :btree
  add_index "avp_messages", ["updated_at"], name: "index_avp_messages_on_updated_at", using: :btree

  create_table "badge_statuses", force: :cascade do |t|
    t.string   "badge_name",                   limit: 255
    t.string   "badge_status",                 limit: 255
    t.string   "remote_object_id",             limit: 255
    t.string   "remote_object_type",           limit: 255
    t.string   "guid",                         limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.boolean  "system",                                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                        default: false
  end

  add_index "badge_statuses", ["guid"], name: "index_badge_statuses_on_guid", using: :btree

  create_table "contributing_sources", force: :cascade do |t|
    t.string   "organization_names",   limit: 255
    t.string   "countries",            limit: 255
    t.string   "administrative_areas", limit: 255
    t.string   "stix_package_stix_id", limit: 255
    t.string   "guid",                 limit: 255
    t.string   "organization_info",    limit: 255
    t.boolean  "is_federal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                default: false
  end

  add_index "contributing_sources", ["updated_at"], name: "index_contributing_sources_on_updated_at", using: :btree

  create_table "course_of_actions", force: :cascade do |t|
    t.string   "title",                        limit: 255
    t.string   "title_c",                      limit: 255
    t.text     "description",                  limit: 65535
    t.string   "description_c",                limit: 255
    t.string   "stix_id",                      limit: 255
    t.string   "portion_marking",              limit: 255
    t.datetime "stix_timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                         limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.integer  "old_acs_set_id",               limit: 4
    t.boolean  "read_only",                                  default: false
    t.string   "description_normalized",       limit: 255
    t.boolean  "is_ciscp",                                   default: false
    t.boolean  "is_mifr",                                    default: false
    t.string   "feeds",                        limit: 255
    t.string   "acs_set_id",                   limit: 255
  end

  add_index "course_of_actions", ["guid"], name: "index_course_of_actions_on_guid", using: :btree
  add_index "course_of_actions", ["stix_id"], name: "index_course_of_actions_on_stix_id", using: :btree
  add_index "course_of_actions", ["updated_at"], name: "index_course_of_actions_on_updated_at", using: :btree

  create_table "cybox_addresses", force: :cascade do |t|
    t.string   "address_value_raw",         limit: 255
    t.string   "address_value_normalized",  limit: 255
    t.string   "category",                  limit: 255
    t.string   "cybox_hash",                limit: 255
    t.string   "cybox_object_id",           limit: 255
    t.decimal  "ip_value_calculated_start",              precision: 10
    t.decimal  "ip_value_calculated_end",                precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                      limit: 255
    t.string   "iso_country_code",          limit: 255
    t.string   "com_threat_score",          limit: 255
    t.string   "gov_threat_score",          limit: 255
    t.string   "agencies_sensors_seen_on",  limit: 1000
    t.string   "first_date_seen_raw",       limit: 255
    t.datetime "first_date_seen"
    t.string   "last_date_seen_raw",        limit: 255
    t.datetime "last_date_seen"
    t.string   "combined_score",            limit: 255
    t.string   "category_list",             limit: 500
    t.string   "portion_marking",           limit: 255
    t.integer  "gfi_id_old",                limit: 4
    t.boolean  "read_only",                                             default: false
    t.boolean  "is_source"
    t.boolean  "is_destination"
    t.boolean  "is_spoofed"
    t.string   "address_condition",         limit: 255,                 default: "Equals"
    t.boolean  "is_ciscp",                                              default: false
    t.boolean  "is_mifr",                                               default: false
    t.string   "feeds",                     limit: 255
  end

  add_index "cybox_addresses", ["address_value_normalized"], name: "index_cybox_addresses_on_address_value_normalized", using: :btree
  add_index "cybox_addresses", ["cybox_object_id"], name: "index_cybox_addresses_on_cybox_object_id", using: :btree
  add_index "cybox_addresses", ["gfi_id_old"], name: "index_cybox_addresses_on_gfi_id", using: :btree
  add_index "cybox_addresses", ["guid"], name: "index_cybox_addresses_on_guid", using: :btree
  add_index "cybox_addresses", ["updated_at"], name: "index_cybox_addresses_on_updated_at", using: :btree

  create_table "cybox_custom_objects", force: :cascade do |t|
    t.string   "custom_name",        limit: 255
    t.string   "string",             limit: 255
    t.string   "string_description", limit: 255
    t.string   "cybox_object_id",    limit: 255
    t.string   "cybox_hash",         limit: 255
    t.string   "user_guid",          limit: 255
    t.string   "guid",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cybox_custom_objects", ["cybox_object_id"], name: "index_cybox_custom_objects_on_cybox_object_id", using: :btree

  create_table "cybox_dns_queries", force: :cascade do |t|
    t.string   "guid",                        limit: 255
    t.string   "cybox_hash",                  limit: 255
    t.string   "cybox_object_id",             limit: 255
    t.string   "portion_marking",             limit: 255
    t.string   "question_normalized_cache",   limit: 255
    t.string   "answer_normalized_cache",     limit: 255
    t.string   "authority_normalized_cache",  limit: 255
    t.string   "additional_normalized_cache", limit: 255
    t.boolean  "is_reference"
    t.boolean  "read_only",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_ciscp",                                default: false
    t.boolean  "is_mifr",                                 default: false
    t.string   "feeds",                       limit: 255
  end

  add_index "cybox_dns_queries", ["cybox_object_id"], name: "index_cybox_dns_queries_on_cybox_object_id", using: :btree
  add_index "cybox_dns_queries", ["guid"], name: "index_cybox_dns_queries_on_guid", using: :btree
  add_index "cybox_dns_queries", ["updated_at"], name: "index_cybox_dns_queries_on_updated_at", using: :btree

  create_table "cybox_dns_records", force: :cascade do |t|
    t.string   "address_class",              limit: 255,   default: "IN"
    t.string   "address_value_normalized",   limit: 255
    t.string   "address_value_raw",          limit: 255
    t.string   "cybox_hash",                 limit: 255
    t.string   "cybox_object_id",            limit: 255
    t.string   "description",                limit: 255
    t.string   "domain_normalized",          limit: 255
    t.string   "domain_raw",                 limit: 255
    t.string   "entry_type",                 limit: 255,   default: "A"
    t.datetime "queried_date"
    t.string   "guid",                       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "legacy_record_name",         limit: 255
    t.string   "legacy_record_type",         limit: 255
    t.integer  "legacy_ttl",                 limit: 4
    t.string   "legacy_flags",               limit: 255
    t.integer  "legacy_data_length",         limit: 4
    t.text     "legacy_record_data",         limit: 65535
    t.string   "portion_marking",            limit: 255
    t.integer  "gfi_id_old",                 limit: 4
    t.boolean  "read_only",                                default: false
    t.string   "address_value_normalized_c", limit: 255
    t.string   "address_class_c",            limit: 255
    t.string   "domain_normalized_c",        limit: 255
    t.string   "entry_type_c",               limit: 255
    t.string   "queried_date_c",             limit: 255
    t.string   "address_cybox_object_id",    limit: 255
    t.string   "domain_cybox_object_id",     limit: 255
    t.string   "record_name",                limit: 255
    t.string   "record_type",                limit: 255
    t.string   "ttl",                        limit: 255
    t.string   "flags",                      limit: 255
    t.string   "data_length",                limit: 255
    t.string   "record_name_c",              limit: 255
    t.string   "record_type_c",              limit: 255
    t.string   "ttl_c",                      limit: 255
    t.string   "flags_c",                    limit: 255
    t.string   "data_length_c",              limit: 255
    t.boolean  "is_ciscp",                                 default: false
    t.boolean  "is_mifr",                                  default: false
    t.string   "feeds",                      limit: 255
  end

  add_index "cybox_dns_records", ["address_value_normalized"], name: "index_cybox_dns_records_on_address_value_normalized", using: :btree
  add_index "cybox_dns_records", ["cybox_object_id"], name: "index_cybox_dns_records_on_cybox_object_id", using: :btree
  add_index "cybox_dns_records", ["domain_normalized"], name: "index_cybox_dns_records_on_domain_normalized", using: :btree
  add_index "cybox_dns_records", ["gfi_id_old"], name: "index_cybox_dns_records_on_gfi_id", using: :btree
  add_index "cybox_dns_records", ["guid"], name: "index_cybox_dns_records_on_guid", using: :btree
  add_index "cybox_dns_records", ["updated_at"], name: "index_cybox_dns_records_on_updated_at", using: :btree

  create_table "cybox_domains", force: :cascade do |t|
    t.string   "cybox_hash",               limit: 255
    t.string   "cybox_object_id",          limit: 255
    t.string   "name_raw",                 limit: 255
    t.string   "name_condition",           limit: 255,  default: "Equals"
    t.string   "Equals",                   limit: 255
    t.string   "name_normalized",          limit: 255
    t.string   "name_type",                limit: 255,  default: "FQDN",   null: false
    t.string   "root_domain",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                     limit: 255
    t.string   "iso_country_code",         limit: 255
    t.string   "com_threat_score",         limit: 255
    t.string   "gov_threat_score",         limit: 255
    t.string   "agencies_sensors_seen_on", limit: 1000
    t.string   "first_date_seen_raw",      limit: 255
    t.datetime "first_date_seen"
    t.string   "last_date_seen_raw",       limit: 255
    t.datetime "last_date_seen"
    t.string   "combined_score",           limit: 255
    t.string   "category_list",            limit: 500
    t.string   "portion_marking",          limit: 255
    t.integer  "gfi_id_old",               limit: 4
    t.boolean  "read_only",                             default: false
    t.boolean  "is_ciscp",                              default: false
    t.boolean  "is_mifr",                               default: false
    t.string   "feeds",                    limit: 255
  end

  add_index "cybox_domains", ["cybox_object_id"], name: "index_cybox_domains_on_cybox_object_id", using: :btree
  add_index "cybox_domains", ["gfi_id_old"], name: "index_cybox_domains_on_gfi_id", using: :btree
  add_index "cybox_domains", ["guid"], name: "index_cybox_domains_on_guid", using: :btree
  add_index "cybox_domains", ["updated_at"], name: "index_cybox_domains_on_updated_at", using: :btree

  create_table "cybox_email_messages", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "cybox_hash",               limit: 255
    t.string   "cybox_object_id",          limit: 255
    t.datetime "email_date"
    t.boolean  "from_is_spoofed",                        default: false
    t.string   "from_raw",                 limit: 255
    t.string   "from_normalized",          limit: 255
    t.string   "message_id",               limit: 255
    t.text     "raw_body",                 limit: 65535
    t.text     "raw_header",               limit: 65535
    t.string   "reply_to_raw",             limit: 255
    t.string   "reply_to_normalized",      limit: 255
    t.boolean  "sender_is_spoofed",                      default: false
    t.string   "sender_raw",               limit: 255
    t.string   "sender_normalized",        limit: 255
    t.datetime "updated_at"
    t.string   "x_mailer",                 limit: 255
    t.string   "x_originating_ip",         limit: 255
    t.string   "guid",                     limit: 255
    t.string   "from_cybox_object_id",     limit: 255
    t.string   "reply_to_cybox_object_id", limit: 255
    t.string   "sender_cybox_object_id",   limit: 255
    t.string   "portion_marking",          limit: 255
    t.integer  "gfi_id_old",               limit: 4
    t.boolean  "read_only",                              default: false
    t.string   "from_normalized_c",        limit: 255
    t.string   "sender_normalized_c",      limit: 255
    t.string   "reply_to_normalized_c",    limit: 255
    t.string   "subject_c",                limit: 255
    t.string   "email_date_c",             limit: 255
    t.string   "raw_body_c",               limit: 255
    t.string   "raw_header_c",             limit: 255
    t.string   "message_id_c",             limit: 255
    t.string   "x_mailer_c",               limit: 255
    t.string   "x_originating_ip_c",       limit: 255
    t.string   "subject_condition",        limit: 255,   default: "Equals"
    t.string   "x_ip_cybox_object_id",     limit: 255
    t.boolean  "is_ciscp",                               default: false
    t.boolean  "is_mifr",                                default: false
    t.string   "subject",                  limit: 4000
    t.string   "feeds",                    limit: 255
  end

  add_index "cybox_email_messages", ["cybox_object_id"], name: "index_cybox_email_messages_on_cybox_object_id", using: :btree
  add_index "cybox_email_messages", ["gfi_id_old"], name: "index_cybox_email_messages_on_gfi_id", using: :btree
  add_index "cybox_email_messages", ["guid"], name: "index_cybox_email_messages_on_guid", using: :btree
  add_index "cybox_email_messages", ["updated_at"], name: "index_cybox_email_messages_on_updated_at", using: :btree

  create_table "cybox_file_hashes", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "cybox_file_id",                  limit: 255
    t.string   "cybox_hash",                     limit: 255
    t.string   "cybox_object_id",                limit: 255
    t.string   "fuzzy_hash_value",               limit: 255
    t.string   "fuzzy_hash_value_normalized",    limit: 255
    t.string   "hash_condition",                 limit: 255, default: "Equals"
    t.string   "hash_type",                      limit: 255
    t.string   "hash_type_vocab_name",           limit: 255
    t.string   "hash_type_vocab_ref",            limit: 255
    t.string   "simple_hash_value",              limit: 255
    t.string   "simple_hash_value_normalized",   limit: 255
    t.datetime "updated_at"
    t.string   "guid",                           limit: 255
    t.boolean  "read_only",                                  default: false
    t.string   "simple_hash_value_normalized_c", limit: 255
    t.string   "fuzzy_hash_value_normalized_c",  limit: 255
    t.boolean  "is_ciscp",                                   default: false
    t.boolean  "is_mifr",                                    default: false
    t.string   "feeds",                          limit: 255
  end

  add_index "cybox_file_hashes", ["cybox_file_id"], name: "index_cybox_file_hashes_on_cybox_file_id", using: :btree
  add_index "cybox_file_hashes", ["cybox_object_id"], name: "index_cybox_file_hashes_on_cybox_object_id", using: :btree
  add_index "cybox_file_hashes", ["fuzzy_hash_value_normalized"], name: "index_cybox_file_hashes_on_fuzzy_hash_value_normalized", using: :btree
  add_index "cybox_file_hashes", ["guid"], name: "index_cybox_file_hashes_on_guid", using: :btree
  add_index "cybox_file_hashes", ["simple_hash_value_normalized"], name: "index_cybox_file_hashes_on_simple_hash_value_normalized", using: :btree

  create_table "cybox_files", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "cybox_hash",                     limit: 255
    t.string   "cybox_object_id",                limit: 255
    t.string   "file_extension",                 limit: 255
    t.string   "file_name_condition",            limit: 255,   default: "Equals"
    t.string   "file_path",                      limit: 255
    t.string   "file_path_condition",            limit: 255,   default: "Equals"
    t.string   "size_in_bytes_condition",        limit: 255,   default: "Equals"
    t.datetime "updated_at"
    t.string   "guid",                           limit: 255
    t.text     "legacy_file_type",               limit: 65535
    t.text     "legacy_registry_edits",          limit: 65535
    t.string   "legacy_av_signature_mcafee",     limit: 255
    t.string   "legacy_av_signature_microsoft",  limit: 255
    t.string   "legacy_av_signature_symantec",   limit: 255
    t.string   "legacy_av_signature_trendmicro", limit: 255
    t.string   "legacy_av_signature_kaspersky",  limit: 255
    t.datetime "legacy_compiled_at"
    t.string   "legacy_compiler_type",           limit: 255
    t.text     "legacy_cve",                     limit: 65535
    t.text     "legacy_keywords",                limit: 65535
    t.text     "legacy_mutex",                   limit: 65535
    t.string   "legacy_packer",                  limit: 255
    t.string   "legacy_xor_key",                 limit: 255
    t.string   "legacy_motif_name",              limit: 255
    t.string   "legacy_motif_size",              limit: 255
    t.string   "legacy_composite_hash",          limit: 255
    t.string   "legacy_command_line",            limit: 255
    t.string   "portion_marking",                limit: 255
    t.integer  "gfi_id_old",                     limit: 4
    t.boolean  "read_only",                                    default: false
    t.string   "file_name_c",                    limit: 255
    t.string   "file_path_c",                    limit: 255
    t.string   "size_in_bytes_c",                limit: 255
    t.boolean  "is_ciscp",                                     default: false
    t.boolean  "is_mifr",                                      default: false
    t.string   "size_in_bytes",                  limit: 255
    t.string   "file_name",                      limit: 4000
    t.string   "feeds",                          limit: 255
  end

  add_index "cybox_files", ["cybox_object_id"], name: "index_cybox_files_on_cybox_object_id", using: :btree
  add_index "cybox_files", ["gfi_id_old"], name: "index_cybox_files_on_gfi_id", using: :btree
  add_index "cybox_files", ["guid"], name: "index_cybox_files_on_guid", using: :btree
  add_index "cybox_files", ["updated_at"], name: "index_cybox_files_on_updated_at", using: :btree

  create_table "cybox_hostnames", force: :cascade do |t|
    t.string   "cybox_hash",            limit: 255
    t.string   "cybox_object_id",       limit: 255
    t.string   "hostname_raw",          limit: 255
    t.string   "hostname_condition",    limit: 255, default: "Equals"
    t.string   "hostname_normalized",   limit: 255
    t.string   "hostname_normalized_c", limit: 255
    t.string   "naming_system",         limit: 255
    t.string   "naming_system_c",       limit: 255
    t.boolean  "is_domain_name",                    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                  limit: 255
    t.string   "portion_marking",       limit: 255
    t.boolean  "read_only",                         default: false
    t.boolean  "is_ciscp",                          default: false
    t.boolean  "is_mifr",                           default: false
    t.string   "feeds",                 limit: 255
  end

  add_index "cybox_hostnames", ["cybox_object_id"], name: "index_cybox_hostnames_on_cybox_object_id", using: :btree
  add_index "cybox_hostnames", ["guid"], name: "index_cybox_hostnames_on_guid", using: :btree
  add_index "cybox_hostnames", ["updated_at"], name: "index_cybox_hostnames_on_updated_at", using: :btree

  create_table "cybox_http_sessions", force: :cascade do |t|
    t.string   "cybox_object_id",      limit: 255
    t.string   "cybox_hash",           limit: 255
    t.string   "user_agent",           limit: 255
    t.string   "guid",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "domain_name",          limit: 255
    t.string   "port",                 limit: 255
    t.string   "referer",              limit: 255
    t.string   "pragma",               limit: 255
    t.string   "portion_marking",      limit: 255
    t.boolean  "read_only",                        default: false
    t.string   "user_agent_c",         limit: 255
    t.string   "domain_name_c",        limit: 255
    t.string   "port_c",               limit: 255
    t.string   "referer_c",            limit: 255
    t.string   "pragma_c",             limit: 255
    t.string   "user_agent_condition", limit: 255, default: "Equals"
    t.boolean  "is_ciscp",                         default: false
    t.boolean  "is_mifr",                          default: false
    t.string   "feeds",                limit: 255
  end

  add_index "cybox_http_sessions", ["cybox_object_id"], name: "index_cybox_http_sessions_on_cybox_object_id", using: :btree
  add_index "cybox_http_sessions", ["guid"], name: "index_cybox_http_sessions_on_guid", using: :btree
  add_index "cybox_http_sessions", ["updated_at"], name: "index_cybox_http_sessions_on_updated_at", using: :btree

  create_table "cybox_links", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "cybox_hash",      limit: 255
    t.string   "cybox_object_id", limit: 255
    t.string   "label",           limit: 255
    t.string   "uri_object_id",   limit: 255
    t.datetime "updated_at"
    t.string   "guid",            limit: 255
    t.string   "portion_marking", limit: 255
    t.boolean  "read_only",                   default: false
    t.string   "label_c",         limit: 255
    t.string   "label_condition", limit: 255, default: "Equals"
    t.boolean  "is_ciscp",                    default: false
    t.boolean  "is_mifr",                     default: false
    t.string   "feeds",           limit: 255
  end

  add_index "cybox_links", ["cybox_object_id"], name: "index_cybox_links_on_cybox_object_id", using: :btree
  add_index "cybox_links", ["guid"], name: "index_cybox_links_on_guid", using: :btree
  add_index "cybox_links", ["updated_at"], name: "index_cybox_links_on_updated_at", using: :btree
  add_index "cybox_links", ["uri_object_id"], name: "index_cybox_links_on_uri_object_id", using: :btree

  create_table "cybox_mutexes", force: :cascade do |t|
    t.string   "cybox_object_id", limit: 255
    t.string   "cybox_hash",      limit: 255
    t.string   "name",            limit: 255
    t.string   "name_condition",  limit: 255, default: "Equals"
    t.string   "guid",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "portion_marking", limit: 255
    t.boolean  "read_only",                   default: false
    t.boolean  "is_ciscp",                    default: false
    t.boolean  "is_mifr",                     default: false
    t.string   "feeds",           limit: 255
  end

  add_index "cybox_mutexes", ["cybox_object_id"], name: "index_cybox_mutexes_on_cybox_object_id", using: :btree
  add_index "cybox_mutexes", ["guid"], name: "index_cybox_mutexes_on_guid", using: :btree
  add_index "cybox_mutexes", ["updated_at"], name: "index_cybox_mutexes_on_updated_at", using: :btree

  create_table "cybox_network_connections", force: :cascade do |t|
    t.string   "cybox_hash",                 limit: 255
    t.string   "cybox_object_id",            limit: 255
    t.string   "dest_socket_address",        limit: 255
    t.boolean  "dest_socket_is_spoofed",                 default: false
    t.string   "dest_socket_port",           limit: 255
    t.string   "old_dest_socket_protocol",   limit: 255
    t.string   "source_socket_address",      limit: 255
    t.boolean  "source_socket_is_spoofed",               default: false
    t.string   "source_socket_port",         limit: 255
    t.string   "old_source_socket_protocol", limit: 255
    t.string   "guid",                       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dest_socket_hostname",       limit: 255
    t.string   "source_socket_hostname",     limit: 255
    t.string   "layer3_protocol",            limit: 255
    t.string   "layer4_protocol",            limit: 255
    t.string   "layer7_protocol",            limit: 255
    t.string   "portion_marking",            limit: 255
    t.boolean  "read_only",                              default: false
    t.string   "dest_socket_address_c",      limit: 255
    t.string   "dest_socket_port_c",         limit: 255
    t.string   "source_socket_address_c",    limit: 255
    t.string   "source_socket_port_c",       limit: 255
    t.string   "layer3_protocol_c",          limit: 255
    t.string   "layer4_protocol_c",          limit: 255
    t.string   "layer7_protocol_c",          limit: 255
    t.string   "dest_socket_hostname_c",     limit: 255
    t.string   "source_socket_hostname_c",   limit: 255
    t.string   "source_socket_address_id",   limit: 255
    t.string   "dest_socket_address_id",     limit: 255
    t.boolean  "is_ciscp",                               default: false
    t.boolean  "is_mifr",                                default: false
    t.string   "feeds",                      limit: 255
  end

  add_index "cybox_network_connections", ["cybox_object_id"], name: "index_cybox_network_connections_on_cybox_object_id", using: :btree
  add_index "cybox_network_connections", ["guid"], name: "index_cybox_network_connections_on_guid", using: :btree
  add_index "cybox_network_connections", ["updated_at"], name: "index_cybox_network_connections_on_updated_at", using: :btree

  create_table "cybox_observables", force: :cascade do |t|
    t.string   "composite_operator", limit: 255
    t.string   "cybox_object_id",    limit: 255
    t.boolean  "is_composite",                   default: false
    t.boolean  "is_imported",                    default: false
    t.boolean  "is_negated",                     default: false
    t.integer  "old_parent_id",      limit: 4
    t.string   "remote_object_id",   limit: 255
    t.string   "remote_object_type", limit: 255
    t.string   "stix_indicator_id",  limit: 255
    t.string   "user_guid",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",               limit: 255
    t.boolean  "read_only",                      default: false
    t.boolean  "is_ciscp",                       default: false
    t.boolean  "is_mifr",                        default: false
    t.string   "feeds",              limit: 255
    t.string   "parent_id",          limit: 255
  end

  add_index "cybox_observables", ["cybox_object_id"], name: "index_cybox_observables_on_cybox_object_id", using: :btree
  add_index "cybox_observables", ["guid"], name: "index_cybox_observables_on_guid", using: :btree
  add_index "cybox_observables", ["parent_id"], name: "index_cybox_observables_on_parent_id", using: :btree
  add_index "cybox_observables", ["remote_object_id"], name: "index_cybox_observables_on_remote_object_id", using: :btree
  add_index "cybox_observables", ["stix_indicator_id"], name: "index_cybox_observables_on_stix_indicator_id", using: :btree
  add_index "cybox_observables", ["updated_at"], name: "index_cybox_observables_on_updated_at", using: :btree

  create_table "cybox_ports", force: :cascade do |t|
    t.string   "cybox_hash",        limit: 255
    t.string   "cybox_object_id",   limit: 255
    t.string   "port",              limit: 255
    t.string   "port_c",            limit: 255
    t.string   "layer4_protocol",   limit: 255
    t.string   "layer4_protocol_c", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",              limit: 255
    t.string   "portion_marking",   limit: 255
    t.boolean  "read_only",                     default: false
    t.boolean  "is_ciscp",                      default: false
    t.boolean  "is_mifr",                       default: false
    t.string   "feeds",             limit: 255
  end

  add_index "cybox_ports", ["cybox_object_id"], name: "index_cybox_ports_on_cybox_object_id", using: :btree
  add_index "cybox_ports", ["guid"], name: "index_cybox_ports_on_guid", using: :btree
  add_index "cybox_ports", ["updated_at"], name: "index_cybox_ports_on_updated_at", using: :btree

  create_table "cybox_socket_addresses", force: :cascade do |t|
    t.string   "cybox_hash",                 limit: 255
    t.string   "cybox_object_id",            limit: 255
    t.string   "addresses_normalized_cache", limit: 255
    t.string   "hostnames_normalized_cache", limit: 255
    t.string   "ports_normalized_cache",     limit: 255
    t.string   "name_condition",             limit: 255
    t.string   "apply_condition",            limit: 255
    t.string   "guid",                       limit: 255
    t.string   "portion_marking",            limit: 255
    t.boolean  "is_reference"
    t.boolean  "read_only",                              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_ciscp",                               default: false
    t.boolean  "is_mifr",                                default: false
    t.string   "feeds",                      limit: 255
  end

  add_index "cybox_socket_addresses", ["cybox_object_id"], name: "index_cybox_socket_addresses_on_cybox_object_id", using: :btree
  add_index "cybox_socket_addresses", ["guid"], name: "index_cybox_socket_addresses_on_guid", using: :btree
  add_index "cybox_socket_addresses", ["updated_at"], name: "index_cybox_socket_addresses_on_updated_at", using: :btree

  create_table "cybox_uris", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "cybox_hash",            limit: 255
    t.string   "cybox_object_id",       limit: 255
    t.string   "old_label",             limit: 255
    t.datetime "updated_at"
    t.string   "uri_type",              limit: 255,   default: "URL"
    t.string   "guid",                  limit: 255
    t.string   "portion_marking",       limit: 255
    t.boolean  "read_only",                           default: false
    t.text     "uri_normalized",        limit: 65535
    t.text     "uri_raw",               limit: 65535
    t.string   "uri_normalized_sha256", limit: 255
    t.string   "uri_condition",         limit: 255,   default: "Equals"
    t.boolean  "is_ciscp",                            default: false
    t.string   "uri_short",             limit: 255
    t.boolean  "is_mifr",                             default: false
    t.string   "feeds",                 limit: 255
  end

  add_index "cybox_uris", ["cybox_object_id"], name: "index_cybox_uris_on_cybox_object_id", using: :btree
  add_index "cybox_uris", ["guid"], name: "index_cybox_uris_on_guid", using: :btree
  add_index "cybox_uris", ["updated_at"], name: "index_cybox_uris_on_updated_at", using: :btree
  add_index "cybox_uris", ["uri_short"], name: "index_cybox_uris_on_uri_short", using: :btree

  create_table "cybox_win_registry_keys", force: :cascade do |t|
    t.string   "cybox_object_id", limit: 255
    t.string   "cybox_hash",      limit: 255
    t.string   "hive",            limit: 255
    t.string   "key",             limit: 255
    t.string   "guid",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "portion_marking", limit: 255
    t.boolean  "read_only",                   default: false
    t.string   "hive_c",          limit: 255
    t.string   "key_c",           limit: 255
    t.string   "hive_condition",  limit: 255, default: "Equals"
    t.boolean  "is_ciscp",                    default: false
    t.boolean  "is_mifr",                     default: false
    t.string   "feeds",           limit: 255
  end

  add_index "cybox_win_registry_keys", ["cybox_object_id"], name: "index_cybox_win_registry_keys_on_cybox_object_id", using: :btree
  add_index "cybox_win_registry_keys", ["guid"], name: "index_cybox_win_registry_keys_on_guid", using: :btree
  add_index "cybox_win_registry_keys", ["updated_at"], name: "index_cybox_win_registry_keys_on_updated_at", using: :btree

  create_table "cybox_win_registry_values", force: :cascade do |t|
    t.string   "cybox_object_id", limit: 255
    t.text     "reg_name",        limit: 65535
    t.text     "reg_value",       limit: 65535
    t.string   "guid",            limit: 255
    t.string   "cybox_hash",      limit: 255
    t.boolean  "read_only",                     default: false
    t.string   "reg_name_c",      limit: 255
    t.string   "reg_value_c",     limit: 255
    t.string   "data_condition",  limit: 255,   default: "Equals"
    t.datetime "updated_at"
  end

  add_index "cybox_win_registry_values", ["cybox_object_id"], name: "index_cybox_win_registry_values_on_cybox_win_reg_key_id", using: :btree

  create_table "disseminated_feeds", force: :cascade do |t|
    t.integer "disseminate_id", limit: 4
    t.string  "feed",           limit: 255
  end

  create_table "disseminated_records", force: :cascade do |t|
    t.string   "stix_id",         limit: 255, null: false
    t.datetime "xml_updated_at"
    t.datetime "disseminated_at"
  end

  add_index "disseminated_records", ["xml_updated_at"], name: "index_disseminated_records_on_xml_updated_at", using: :btree

  create_table "dissemination_queue", force: :cascade do |t|
    t.string   "original_input_id", limit: 255
    t.string   "finished_feeds",    limit: 255
    t.datetime "updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dms_labels", force: :cascade do |t|
    t.datetime "dms_record_date"
    t.integer  "dms_record_id",      limit: 4
    t.boolean  "is_vetted",                      default: false
    t.string   "remote_object_id",   limit: 255
    t.string   "remote_object_type", limit: 255
    t.string   "source",             limit: 255
    t.integer  "version_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dms_labels", ["dms_record_id"], name: "index_dms_labels_on_dms_record_id", using: :btree

  create_table "dns_query_questions", force: :cascade do |t|
    t.string   "dns_query_id",      limit: 255
    t.string   "question_id",       limit: 255
    t.string   "guid",              limit: 255
    t.string   "user_guid",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "dns_query_questions", ["dns_query_id"], name: "index_dns_query_questions_on_dns_query_id", using: :btree
  add_index "dns_query_questions", ["guid"], name: "index_dns_query_questions_on_guid", using: :btree
  add_index "dns_query_questions", ["question_id"], name: "index_dns_query_questions_on_question_id", using: :btree

  create_table "dns_query_resource_records", force: :cascade do |t|
    t.string   "dns_query_id",       limit: 255
    t.string   "resource_record_id", limit: 255
    t.string   "guid",               limit: 255
    t.string   "user_guid",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",              default: false
  end

  add_index "dns_query_resource_records", ["dns_query_id"], name: "index_dns_query_resource_records_on_dns_query_id", using: :btree
  add_index "dns_query_resource_records", ["guid"], name: "index_dns_query_resource_records_on_guid", using: :btree
  add_index "dns_query_resource_records", ["resource_record_id"], name: "index_dns_query_resource_records_on_resource_record_id", using: :btree

  create_table "download_temp", force: :cascade do |t|
    t.string "user_guid", limit: 255,   null: false
    t.binary "download",  limit: 65535, null: false
  end

  add_index "download_temp", ["user_guid"], name: "index_download_temp_on_user_guid", using: :btree

  create_table "email_files", force: :cascade do |t|
    t.string   "email_message_id",  limit: 255
    t.string   "cybox_file_id",     limit: 255
    t.string   "guid",              limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",             default: false
  end

  create_table "email_links", force: :cascade do |t|
    t.integer  "old_email_message_id", limit: 4
    t.integer  "old_link_id",          limit: 4
    t.string   "guid",                 limit: 255
    t.datetime "updated_at"
    t.string   "email_message_id",     limit: 255
    t.string   "link_id",              limit: 255
    t.boolean  "transfer_from_low",                default: false
  end

  create_table "email_uris", force: :cascade do |t|
    t.integer  "old_email_message_id", limit: 4
    t.integer  "old_uri_id",           limit: 4
    t.string   "guid",                 limit: 255
    t.datetime "updated_at"
    t.string   "email_message_id",     limit: 255
    t.string   "uri_id",               limit: 255
    t.boolean  "transfer_from_low",                default: false
  end

  create_table "error_messages", force: :cascade do |t|
    t.text     "admin_description", limit: 65535
    t.boolean  "is_warning",                      default: false
    t.integer  "old_source_id",     limit: 4
    t.string   "source_type",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description",       limit: 65535
    t.string   "guid",              limit: 255
    t.string   "source_id",         limit: 255
    t.boolean  "transfer_from_low",               default: false
  end

  add_index "error_messages", ["source_id"], name: "index_error_messages_on_source_id", using: :btree

  create_table "exploit_target_coas", force: :cascade do |t|
    t.string   "stix_exploit_target_id",   limit: 255
    t.string   "stix_course_of_action_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                     limit: 255
    t.string   "user_guid",                limit: 255
    t.boolean  "transfer_from_low",                    default: false
  end

  add_index "exploit_target_coas", ["guid"], name: "index_exploit_target_coas_on_guid", using: :btree
  add_index "exploit_target_coas", ["stix_course_of_action_id"], name: "index_exploit_target_coas_on_stix_course_of_action_id", using: :btree
  add_index "exploit_target_coas", ["stix_exploit_target_id"], name: "index_exploit_target_coas_on_stix_exploit_target_id", using: :btree

  create_table "exploit_target_packages", force: :cascade do |t|
    t.string   "stix_exploit_target_id", limit: 255
    t.string   "stix_package_id",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                   limit: 255
    t.string   "user_guid",              limit: 255
    t.boolean  "transfer_from_low",                  default: false
  end

  add_index "exploit_target_packages", ["guid"], name: "index_exploit_target_packages_on_guid", using: :btree
  add_index "exploit_target_packages", ["stix_exploit_target_id"], name: "index_exploit_target_packages_on_stix_exploit_target_id", using: :btree
  add_index "exploit_target_packages", ["stix_package_id"], name: "index_exploit_target_packages_on_stix_package_id", using: :btree

  create_table "exploit_target_vulnerabilities", force: :cascade do |t|
    t.string   "stix_exploit_target_id", limit: 255
    t.string   "vulnerability_guid",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                   limit: 255
    t.string   "user_guid",              limit: 255
    t.boolean  "transfer_from_low",                  default: false
  end

  add_index "exploit_target_vulnerabilities", ["guid"], name: "index_exploit_target_vulnerabilities_on_guid", using: :btree
  add_index "exploit_target_vulnerabilities", ["stix_exploit_target_id"], name: "index_exploit_target_vulnerabilities_on_stix_exploit_target_id", using: :btree
  add_index "exploit_target_vulnerabilities", ["vulnerability_guid"], name: "index_exploit_target_vulnerabilities_on_vulnerability_guid", using: :btree

  create_table "exploit_targets", force: :cascade do |t|
    t.string   "stix_id",                      limit: 255
    t.string   "portion_marking",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                         limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.integer  "old_acs_set_id",               limit: 4
    t.datetime "stix_timestamp"
    t.boolean  "read_only",                                default: false
    t.boolean  "is_ciscp",                                 default: false
    t.boolean  "is_mifr",                                  default: false
    t.string   "feeds",                        limit: 255
    t.string   "acs_set_id",                   limit: 255
  end

  add_index "exploit_targets", ["guid"], name: "index_exploit_targets_on_guid", using: :btree
  add_index "exploit_targets", ["stix_id"], name: "index_exploit_targets_on_stix_id", using: :btree
  add_index "exploit_targets", ["updated_at"], name: "index_exploit_targets_on_updated_at", using: :btree

  create_table "exported_indicators", force: :cascade do |t|
    t.string   "system",                        limit: 255
    t.string   "color",                         limit: 255
    t.string   "guid",                          limit: 255
    t.datetime "exported_at"
    t.text     "description",                   limit: 65535
    t.string   "indicator_id",                  limit: 255
    t.string   "user_id",                       limit: 255
    t.datetime "detasked_at"
    t.datetime "updated_at"
    t.string   "status",                        limit: 255
    t.string   "sid2",                          limit: 255
    t.string   "comments_normalized",           limit: 255
    t.datetime "date_added"
    t.string   "event",                         limit: 255
    t.string   "event_classification",          limit: 255
    t.string   "nai",                           limit: 255
    t.string   "nai_classification",            limit: 255
    t.string   "special_instructions",          limit: 255
    t.string   "sid",                           limit: 255
    t.string   "reference",                     limit: 255
    t.string   "cs_regex",                      limit: 255
    t.string   "clear_text",                    limit: 255
    t.string   "signature_location",            limit: 255
    t.string   "ps_regex",                      limit: 255
    t.string   "observable_value",              limit: 255
    t.string   "indicator_title",               limit: 255
    t.string   "indicator_stix_id",             limit: 255
    t.string   "indicator_type",                limit: 255
    t.string   "indicator_classification",      limit: 255
    t.string   "indicator_type_classification", limit: 255
    t.string   "username",                      limit: 255
    t.text     "comments",                      limit: 65535
    t.boolean  "transfer_from_low",                           default: false
  end

  add_index "exported_indicators", ["updated_at"], name: "index_exported_indicators_on_updated_at", using: :btree

  create_table "further_sharings", force: :cascade do |t|
    t.string   "scope",                        limit: 255,                 null: false
    t.string   "effect",                       limit: 255,                 null: false
    t.string   "isa_assertion_structure_guid", limit: 255
    t.string   "guid",                         limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                        default: false
  end

  create_table "gfis", force: :cascade do |t|
    t.text    "gfi_source_name",           limit: 65535
    t.text    "gfi_action_name",           limit: 65535
    t.text    "gfi_action_name_class",     limit: 65535
    t.text    "gfi_action_name_subclass",  limit: 65535
    t.text    "gfi_ps_regex",              limit: 65535
    t.text    "gfi_ps_regex_class",        limit: 65535
    t.text    "gfi_ps_regex_subclass",     limit: 65535
    t.text    "gfi_cs_regex",              limit: 65535
    t.text    "gfi_cs_regex_class",        limit: 65535
    t.text    "gfi_cs_regex_subclass",     limit: 65535
    t.text    "gfi_exp_sig_loc",           limit: 65535
    t.text    "gfi_exp_sig_loc_class",     limit: 65535
    t.text    "gfi_exp_sig_loc_subclass",  limit: 65535
    t.integer "gfi_bluesmoke_id",          limit: 4
    t.integer "gfi_uscert_sid",            limit: 4
    t.text    "gfi_notes",                 limit: 65535
    t.text    "gfi_notes_class",           limit: 65535
    t.text    "gfi_notes_subclass",        limit: 65535
    t.text    "gfi_status",                limit: 65535
    t.text    "gfi_uscert_doc",            limit: 65535
    t.text    "gfi_uscert_doc_class",      limit: 65535
    t.text    "gfi_uscert_doc_subclass",   limit: 65535
    t.text    "gfi_special_inst",          limit: 65535
    t.text    "gfi_special_inst_class",    limit: 65535
    t.text    "gfi_special_inst_subclass", limit: 65535
    t.text    "gfi_type",                  limit: 65535
    t.text    "old_guid",                  limit: 65535
    t.string  "guid",                      limit: 255
    t.string  "remote_object_id",          limit: 255
    t.string  "remote_object_type",        limit: 255
  end

  add_index "gfis", ["remote_object_id"], name: "index_gfis_on_remote_object_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.integer  "created_by_id", limit: 4
    t.integer  "updated_by_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",          limit: 255
  end

  add_index "groups", ["guid"], name: "index_groups_on_guid", using: :btree

  create_table "groups_permissions", force: :cascade do |t|
    t.integer  "group_id",      limit: 4
    t.integer  "permission_id", limit: 4
    t.integer  "created_by_id", limit: 4
    t.datetime "created_at"
    t.string   "guid",          limit: 255
  end

  add_index "groups_permissions", ["guid"], name: "index_groups_permissions_on_guid", using: :btree

  create_table "human_review_fields", force: :cascade do |t|
    t.boolean  "is_changed",                          default: false
    t.integer  "human_review_id",       limit: 4
    t.string   "object_field",          limit: 255,                   null: false
    t.text     "object_field_revised",  limit: 65535
    t.text     "object_field_original", limit: 65535
    t.string   "object_uid",            limit: 255
    t.string   "object_type",           limit: 255
    t.string   "object_sha2",           limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "has_pii"
  end

  add_index "human_review_fields", ["human_review_id"], name: "index_human_review_fields_on_human_review_id", using: :btree

  create_table "human_reviews", force: :cascade do |t|
    t.datetime "decided_at"
    t.string   "decided_by",                     limit: 255
    t.string   "status",                         limit: 1,   default: "N", null: false
    t.integer  "uploaded_file_id",               limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "human_review_fields_count",      limit: 4,   default: 0
    t.integer  "comp_human_review_fields_count", limit: 4,   default: 0
  end

  create_table "id_mappings", force: :cascade do |t|
    t.string   "before_id",  limit: 255
    t.string   "after_id",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "id_mappings", ["after_id"], name: "index_id_mappings_on_after_id", using: :btree
  add_index "id_mappings", ["before_id"], name: "index_id_mappings_on_before_id", using: :btree

  create_table "indicator_ttps", force: :cascade do |t|
    t.string   "stix_ttp_id",       limit: 255
    t.string   "stix_indicator_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",              limit: 255
    t.string   "user_guid",         limit: 255
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "indicator_ttps", ["guid"], name: "index_indicator_ttps_on_guid", using: :btree
  add_index "indicator_ttps", ["stix_indicator_id"], name: "index_indicator_ttps_on_stix_indicator_id", using: :btree
  add_index "indicator_ttps", ["stix_ttp_id"], name: "index_indicator_ttps_on_stix_ttp_id", using: :btree

  create_table "indicator_zips", force: :cascade do |t|
    t.integer "uploaded_file_id", limit: 4
    t.integer "indicator_id",     limit: 4
  end

  add_index "indicator_zips", ["uploaded_file_id"], name: "index_indicator_zips_on_uploaded_file_id", using: :btree

  create_table "indicators_course_of_actions", force: :cascade do |t|
    t.string   "stix_indicator_id",   limit: 255
    t.string   "course_of_action_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                limit: 255
    t.string   "user_guid",           limit: 255
    t.boolean  "transfer_from_low",               default: false
  end

  add_index "indicators_course_of_actions", ["course_of_action_id"], name: "index_indicators_course_of_actions_on_course_of_action_id", using: :btree
  add_index "indicators_course_of_actions", ["guid"], name: "index_indicators_course_of_actions_on_guid", using: :btree
  add_index "indicators_course_of_actions", ["stix_indicator_id"], name: "index_indicators_course_of_actions_on_stix_indicator_id", using: :btree

  create_table "indicators_threat_actors", force: :cascade do |t|
    t.string   "threat_actor_id",   limit: 255
    t.string   "stix_indicator_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",              limit: 255
    t.string   "user_guid",         limit: 255
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "indicators_threat_actors", ["guid"], name: "index_indicators_threat_actors_on_guid", using: :btree
  add_index "indicators_threat_actors", ["stix_indicator_id"], name: "index_indicators_threat_actors_on_stix_indicator_id", using: :btree
  add_index "indicators_threat_actors", ["threat_actor_id"], name: "index_indicators_threat_actors_on_threat_actor_id", using: :btree

  create_table "isa_assertion_structures", force: :cascade do |t|
    t.string   "cs_classification",       limit: 255, default: "U",    null: false
    t.string   "cs_countries",            limit: 255
    t.string   "cs_cui",                  limit: 255
    t.string   "cs_entity",               limit: 255
    t.string   "cs_formal_determination", limit: 255
    t.string   "cs_orgs",                 limit: 255
    t.string   "cs_shargrp",              limit: 255
    t.string   "guid",                    limit: 255,                  null: false
    t.boolean  "is_default_marking",                  default: false,  null: false
    t.string   "privilege_default",       limit: 255, default: "deny", null: false
    t.boolean  "public_release",                      default: false,  null: false
    t.string   "public_released_by",      limit: 255
    t.datetime "public_released_on"
    t.string   "stix_id",                 limit: 255,                  null: false
    t.string   "stix_marking_id",         limit: 255
    t.string   "cs_info_caveat",          limit: 255
    t.string   "sharing_default",         limit: 255
    t.string   "classified_by",           limit: 255
    t.datetime "classified_on"
    t.string   "classification_reason",   limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                   default: false
  end

  create_table "isa_entity_caches", force: :cascade do |t|
    t.string   "admin_org",          limit: 255, default: "USA.DHS.US-CERT", null: false
    t.boolean  "ato_status",                     default: true,              null: false
    t.string   "clearance",          limit: 255, default: "U",               null: false
    t.string   "country",            limit: 255, default: "USA",             null: false
    t.string   "distinguished_name", limit: 255
    t.string   "duty_org",           limit: 255, default: "USA.DHS.US-CERT", null: false
    t.string   "entity_class",       limit: 255, default: "PE",              null: false
    t.string   "entity_type",        limit: 255, default: "GOV",             null: false
    t.string   "life_cycle_status",  limit: 255, default: "PROD",            null: false
    t.string   "user_guid",          limit: 255,                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_groups",      limit: 255
    t.string   "guid",               limit: 255
    t.boolean  "transfer_from_low",              default: false
  end

  create_table "isa_marking_structures", force: :cascade do |t|
    t.datetime "data_item_created_at"
    t.string   "guid",                 limit: 255,                 null: false
    t.string   "re_custodian",         limit: 255,                 null: false
    t.string   "re_originator",        limit: 255
    t.string   "stix_id",              limit: 255,                 null: false
    t.string   "stix_marking_id",      limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                default: false
  end

  create_table "isa_privs", force: :cascade do |t|
    t.string   "action",                       limit: 255
    t.string   "effect",                       limit: 255,  default: "deny", null: false
    t.string   "guid",                         limit: 255
    t.string   "isa_assertion_structure_guid", limit: 255
    t.string   "scope_countries",              limit: 1000
    t.string   "scope_entity",                 limit: 255
    t.boolean  "scope_is_all",                              default: true,   null: false
    t.string   "scope_orgs",                   limit: 255
    t.string   "scope_shargrp",                limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                         default: false
  end

  add_index "isa_privs", ["guid"], name: "index_isa_privs_on_guid", using: :btree
  add_index "isa_privs", ["isa_assertion_structure_guid"], name: "index_isa_privs_on_isa_marking_structure_guid", using: :btree

  create_table "layer_seven_connections", force: :cascade do |t|
    t.string   "guid",            limit: 255
    t.string   "cybox_hash",      limit: 255
    t.string   "portion_marking", limit: 255
    t.string   "http_session_id", limit: 255
    t.string   "dns_query_cache", limit: 255
    t.boolean  "is_reference"
    t.boolean  "read_only",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "layer_seven_connections", ["guid"], name: "index_layer_seven_connections_on_guid", using: :btree
  add_index "layer_seven_connections", ["updated_at"], name: "index_layer_seven_connections_on_updated_at", using: :btree

  create_table "legacy_section_hashes", force: :cascade do |t|
    t.string   "indicator_guid", limit: 255
    t.string   "hsh",            limit: 255
    t.string   "name",           limit: 255
    t.string   "ord",            limit: 255
    t.string   "size",           limit: 255
    t.string   "hash_type",      limit: 255
    t.string   "vsize",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legacy_yara_rules", force: :cascade do |t|
    t.string  "name",            limit: 255
    t.integer "string_location", limit: 4
    t.string  "string",          limit: 255
    t.text    "rule",            limit: 65535
    t.string  "indicator_guid",  limit: 255
  end

  create_table "lsc_dns_queries", force: :cascade do |t|
    t.string   "layer_seven_connection_id", limit: 255
    t.string   "dns_query_id",              limit: 255
    t.string   "guid",                      limit: 255
    t.string   "user_guid",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                     default: false
  end

  add_index "lsc_dns_queries", ["dns_query_id"], name: "index_lsc_dns_queries_on_dns_query_id", using: :btree
  add_index "lsc_dns_queries", ["guid"], name: "index_lsc_dns_queries_on_guid", using: :btree
  add_index "lsc_dns_queries", ["layer_seven_connection_id"], name: "index_lsc_dns_queries_on_layer_seven_connection_id", using: :btree

  create_table "nc_layer_seven_connections", force: :cascade do |t|
    t.string   "network_connection_id",     limit: 255
    t.string   "layer_seven_connection_id", limit: 255
    t.string   "guid",                      limit: 255
    t.string   "user_guid",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                     default: false
  end

  add_index "nc_layer_seven_connections", ["guid"], name: "index_nc_layer_seven_connections_on_guid", using: :btree
  add_index "nc_layer_seven_connections", ["layer_seven_connection_id"], name: "index_nc_layer_seven_connections_on_layer_seven_connection_id", using: :btree
  add_index "nc_layer_seven_connections", ["network_connection_id"], name: "index_nc_layer_seven_connections_on_network_connection_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "guid",              limit: 255
    t.string   "target_class",      limit: 255
    t.string   "target_guid",       limit: 255
    t.string   "user_guid",         limit: 255
    t.text     "note",              limit: 65535
    t.string   "justification",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",               default: false
  end

  create_table "old_isa_marking_structures", force: :cascade do |t|
    t.string   "cs_classification",       limit: 255
    t.string   "cs_countries",            limit: 1000
    t.string   "cs_cui",                  limit: 255
    t.string   "cs_entity",               limit: 255
    t.string   "cs_formal_determination", limit: 255
    t.string   "cs_info_caveat",          limit: 255
    t.string   "cs_orgs",                 limit: 255
    t.string   "cs_shargrp",              limit: 255
    t.string   "guid",                    limit: 255
    t.string   "is_default_marking",      limit: 255,  default: "0",    null: false
    t.string   "is_reference",            limit: 255,  default: "0",    null: false
    t.string   "marking_model_type",      limit: 255
    t.string   "privilege_default",       limit: 255,  default: "deny", null: false
    t.boolean  "public_release",                       default: false,  null: false
    t.string   "public_released_by",      limit: 255
    t.datetime "public_released_on"
    t.string   "re_custodian",            limit: 255
    t.datetime "re_data_item_created_at"
    t.string   "re_originator",           limit: 255
    t.string   "stix_id",                 limit: 255
    t.string   "stix_marking_guid",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "old_isa_marking_structures", ["guid"], name: "index_isa_marking_structures_on_guid", using: :btree
  add_index "old_isa_marking_structures", ["stix_id"], name: "index_isa_marking_structures_on_stix_id", using: :btree
  add_index "old_isa_marking_structures", ["stix_marking_guid"], name: "index_isa_marking_structures_on_stix_marking_guid", using: :btree

  create_table "old_isa_markings", force: :cascade do |t|
    t.string   "community_dissemination",   limit: 2000
    t.datetime "data_item_created_at"
    t.string   "dissemination_controls",    limit: 255
    t.string   "guid",                      limit: 255
    t.string   "org_dissemination",         limit: 255
    t.boolean  "public_release",                         default: false, null: false
    t.string   "re_country",                limit: 2000
    t.string   "re_organization",           limit: 255
    t.string   "re_suborganization",        limit: 255
    t.string   "releasable_to",             limit: 255
    t.string   "stix_marking_id",           limit: 255
    t.string   "user_status_dissemination", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "old_isa_markings", ["stix_marking_id"], name: "index_isa_markings_on_stix_marking_id", using: :btree

  create_table "old_stix_kill_chains", force: :cascade do |t|
    t.string  "kill_chain_id",      limit: 255
    t.string  "kill_chain_name",    limit: 255
    t.integer "ordinality",         limit: 4
    t.string  "phase_id",           limit: 255
    t.string  "phase_name",         limit: 255
    t.string  "remote_object_id",   limit: 255
    t.string  "remote_object_type", limit: 255
    t.string  "guid",               limit: 255
  end

  add_index "old_stix_kill_chains", ["guid"], name: "index_stix_kill_chains_on_guid", using: :btree
  add_index "old_stix_kill_chains", ["remote_object_id"], name: "index_stix_kill_chains_on_remote_object_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.integer  "r5_id",               limit: 4
    t.string   "guid",                limit: 255
    t.string   "long_name",           limit: 255
    t.string   "short_name",          limit: 255
    t.text     "contact_info",        limit: 65535
    t.string   "category",            limit: 255
    t.integer  "releasability_mask",  limit: 4,     default: 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organization_token",  limit: 255
    t.integer  "old_acs_sets_org_id", limit: 4
    t.string   "acs_sets_org_id",     limit: 255
    t.boolean  "transfer_from_low",                 default: false
  end

  create_table "original_input", force: :cascade do |t|
    t.boolean  "old_is_attachment",                  default: false, null: false
    t.string   "mime_type",            limit: 255,                   null: false
    t.binary   "raw_content",          limit: 65535,                 null: false
    t.string   "remote_object_id",     limit: 255
    t.string   "remote_object_type",   limit: 255
    t.integer  "old_uploaded_file_id", limit: 4,                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                 limit: 255
    t.string   "sha2_hash",            limit: 255
    t.string   "input_category",       limit: 255
    t.string   "input_sub_category",   limit: 255
    t.string   "uploaded_file_id",     limit: 255
    t.boolean  "transfer_from_low",                  default: false
  end

  add_index "original_input", ["guid"], name: "index_original_input_on_guid", using: :btree
  add_index "original_input", ["remote_object_id"], name: "index_original_input_on_remote_object_id", using: :btree
  add_index "original_input", ["uploaded_file_id"], name: "index_original_input_on_uploaded_file_id", using: :btree

  create_table "original_input_id_mappings", force: :cascade do |t|
    t.integer "original_input_id",  limit: 4
    t.integer "ciap_id_mapping_id", limit: 4
  end

  create_table "packages_course_of_actions", force: :cascade do |t|
    t.string   "stix_package_id",     limit: 255
    t.string   "course_of_action_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                limit: 255
    t.string   "user_guid",           limit: 255
    t.boolean  "transfer_from_low",               default: false
  end

  add_index "packages_course_of_actions", ["course_of_action_id"], name: "index_packages_course_of_actions_on_course_of_action_id", using: :btree
  add_index "packages_course_of_actions", ["guid"], name: "index_packages_course_of_actions_on_guid", using: :btree
  add_index "packages_course_of_actions", ["stix_package_id"], name: "index_packages_course_of_actions_on_stix_package_id", using: :btree

  create_table "parameter_observables", force: :cascade do |t|
    t.string   "cybox_object_id",          limit: 255
    t.boolean  "is_imported",                          default: false
    t.string   "remote_object_id",         limit: 255
    t.string   "remote_object_type",       limit: 255
    t.string   "stix_course_of_action_id", limit: 255
    t.string   "user_guid",                limit: 255
    t.string   "guid",                     limit: 255
    t.boolean  "read_only",                            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parameter_observables", ["cybox_object_id"], name: "index_parameter_observables_on_cybox_object_id", using: :btree
  add_index "parameter_observables", ["guid"], name: "index_parameter_observables_on_guid", using: :btree
  add_index "parameter_observables", ["remote_object_id"], name: "index_parameter_observables_on_remote_object_id", using: :btree
  add_index "parameter_observables", ["stix_course_of_action_id"], name: "index_parameter_observables_on_stix_course_of_action_id", using: :btree
  add_index "parameter_observables", ["updated_at"], name: "index_parameter_observables_on_updated_at", using: :btree

  create_table "passwords", force: :cascade do |t|
    t.string   "password_hash",   limit: 255
    t.string   "password_salt",   limit: 255
    t.boolean  "requires_change",             default: false
    t.string   "user_guid",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pending_amqp_messages", force: :cascade do |t|
    t.boolean  "is_stix_xml",                                 null: false
    t.string   "transfer_category", limit: 255
    t.string   "repl_type",         limit: 255
    t.binary   "message_data",      limit: 65535,             null: false
    t.binary   "string_props",      limit: 65535,             null: false
    t.datetime "last_attempted"
    t.integer  "attempt_count",     limit: 4,     default: 0, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "pending_markings", force: :cascade do |t|
    t.string   "remote_object_type", limit: 255
    t.string   "remote_object_guid", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "pending_markings", ["remote_object_guid"], name: "index_pending_markings_on_remote_object_guid", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "display_name",  limit: 255
    t.string   "description",   limit: 255
    t.integer  "created_by_id", limit: 4
    t.integer  "updated_by_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",          limit: 255
  end

  add_index "permissions", ["guid"], name: "index_permissions_on_guid", using: :btree

  create_table "question_uris", force: :cascade do |t|
    t.string   "question_id",       limit: 255
    t.string   "uri_id",            limit: 255
    t.string   "guid",              limit: 255
    t.string   "user_guid",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "question_uris", ["guid"], name: "index_question_uris_on_guid", using: :btree
  add_index "question_uris", ["question_id"], name: "index_question_uris_on_question_id", using: :btree
  add_index "question_uris", ["uri_id"], name: "index_question_uris_on_uri_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "guid",            limit: 255
    t.string   "cybox_hash",      limit: 255
    t.string   "portion_marking", limit: 255
    t.string   "qclass",          limit: 255
    t.string   "qtype",           limit: 255
    t.string   "qname_cache",     limit: 255
    t.boolean  "is_reference"
    t.boolean  "read_only",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_ciscp",                    default: false
    t.boolean  "is_mifr",                     default: false
    t.string   "feeds",           limit: 255
  end

  add_index "questions", ["guid"], name: "index_questions_on_guid", using: :btree
  add_index "questions", ["updated_at"], name: "index_questions_on_updated_at", using: :btree

  create_table "r5destinations", force: :cascade do |t|
    t.string  "r5table", limit: 255
    t.integer "r5id",    limit: 4
    t.string  "r6table", limit: 255
    t.integer "r6id",    limit: 4
  end

  create_table "r5tracking", force: :cascade do |t|
    t.string  "table",  limit: 255
    t.integer "old_id", limit: 4
  end

  create_table "replications", force: :cascade do |t|
    t.string "version",      limit: 255
    t.string "url",          limit: 255
    t.string "api_key",      limit: 255
    t.string "api_key_hash", limit: 255
    t.string "last_status",  limit: 255
    t.string "repl_type",    limit: 255
    t.date   "updated_at"
    t.date   "created_at"
  end

  create_table "reported_issues", force: :cascade do |t|
    t.string   "subject",     limit: 255
    t.string   "description", limit: 255
    t.string   "user_guid",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "called_from", limit: 255
  end

  create_table "resource_record_dns_records", force: :cascade do |t|
    t.string   "resource_record_id", limit: 255
    t.string   "dns_record_id",      limit: 255
    t.string   "guid",               limit: 255
    t.string   "user_guid",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",              default: false
  end

  add_index "resource_record_dns_records", ["dns_record_id"], name: "index_resource_record_dns_records_on_dns_record_id", using: :btree
  add_index "resource_record_dns_records", ["guid"], name: "index_resource_record_dns_records_on_guid", using: :btree
  add_index "resource_record_dns_records", ["resource_record_id"], name: "index_resource_record_dns_records_on_resource_record_id", using: :btree

  create_table "resource_records", force: :cascade do |t|
    t.string   "guid",             limit: 255
    t.string   "cybox_hash",       limit: 255
    t.string   "portion_marking",  limit: 255
    t.string   "record_type",      limit: 255
    t.string   "dns_record_cache", limit: 255
    t.boolean  "is_reference"
    t.boolean  "read_only",                    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_ciscp",                     default: false
    t.boolean  "is_mifr",                      default: false
    t.string   "feeds",            limit: 255
  end

  add_index "resource_records", ["guid"], name: "index_resource_records_on_guid", using: :btree
  add_index "resource_records", ["updated_at"], name: "index_resource_records_on_updated_at", using: :btree

  create_table "search_logs", force: :cascade do |t|
    t.text     "query",      limit: 65535
    t.string   "user_guid",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_structures", force: :cascade do |t|
    t.string   "guid",              limit: 255,                   null: false
    t.text     "statement",         limit: 65535,                 null: false
    t.string   "stix_id",           limit: 255,                   null: false
    t.string   "stix_marking_id",   limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",               default: false
  end

  create_table "socket_address_addresses", force: :cascade do |t|
    t.string   "socket_address_id", limit: 255
    t.string   "address_id",        limit: 255
    t.string   "guid",              limit: 255
    t.string   "user_guid",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "socket_address_addresses", ["address_id"], name: "index_socket_address_addresses_on_address_id", using: :btree
  add_index "socket_address_addresses", ["guid"], name: "index_socket_address_addresses_on_guid", using: :btree
  add_index "socket_address_addresses", ["socket_address_id"], name: "index_socket_address_addresses_on_socket_address_id", using: :btree

  create_table "socket_address_hostnames", force: :cascade do |t|
    t.string   "socket_address_id", limit: 255
    t.string   "hostname_id",       limit: 255
    t.string   "guid",              limit: 255
    t.string   "user_guid",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "socket_address_hostnames", ["guid"], name: "index_socket_address_hostnames_on_guid", using: :btree
  add_index "socket_address_hostnames", ["hostname_id"], name: "index_socket_address_hostnames_on_hostname_id", using: :btree
  add_index "socket_address_hostnames", ["socket_address_id"], name: "index_socket_address_hostnames_on_socket_address_id", using: :btree

  create_table "socket_address_ports", force: :cascade do |t|
    t.string   "socket_address_id", limit: 255
    t.string   "port_id",           limit: 255
    t.string   "guid",              limit: 255
    t.string   "user_guid",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "socket_address_ports", ["guid"], name: "index_socket_address_ports_on_guid", using: :btree
  add_index "socket_address_ports", ["port_id"], name: "index_socket_address_ports_on_port_id", using: :btree
  add_index "socket_address_ports", ["socket_address_id"], name: "index_socket_address_ports_on_socket_address_id", using: :btree

  create_table "solr_index_time", force: :cascade do |t|
    t.datetime "last_updated"
  end

  create_table "staging_weather_map_data", id: false, force: :cascade do |t|
    t.string "ip_address",               limit: 255
    t.string "iso_country_code",         limit: 255
    t.string "com_threat_score",         limit: 255
    t.string "gov_threat_score",         limit: 255
    t.string "combined_score",           limit: 255
    t.string "agencies_sensors_seen_on", limit: 1000
    t.string "first_date_seen",          limit: 255
    t.string "last_date_seen",           limit: 255
    t.string "category_list",            limit: 1000
  end

  create_table "stix_confidences", force: :cascade do |t|
    t.string   "value",              limit: 255,                   null: false
    t.text     "description",        limit: 65535
    t.string   "source",             limit: 255
    t.boolean  "is_official",                      default: false
    t.integer  "confidence_num",     limit: 4,                     null: false
    t.datetime "created_at"
    t.datetime "stix_timestamp"
    t.string   "user_guid",          limit: 255
    t.string   "remote_object_type", limit: 255,                   null: false
    t.string   "remote_object_id",   limit: 255,                   null: false
    t.string   "guid",               limit: 255
    t.boolean  "from_file",                        default: false
    t.boolean  "transfer_from_low",                default: false
  end

  create_table "stix_indicators", force: :cascade do |t|
    t.string   "composite_operator",           limit: 255
    t.datetime "created_at"
    t.text     "description",                  limit: 65535
    t.string   "indicator_type",               limit: 255
    t.string   "indicator_type_vocab_name",    limit: 255
    t.string   "indicator_type_vocab_ref",     limit: 255
    t.boolean  "is_composite",                               default: false
    t.boolean  "is_negated",                                 default: false
    t.boolean  "is_imported",                                default: false
    t.boolean  "is_reference",                               default: false
    t.integer  "old_parent_id",                limit: 4
    t.integer  "resp_entity_stix_ident_id",    limit: 4
    t.string   "stix_id",                      limit: 255
    t.string   "dms_label",                    limit: 255
    t.datetime "stix_timestamp"
    t.string   "title",                        limit: 255
    t.datetime "updated_at"
    t.string   "downgrade_request_id",         limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.string   "guid",                         limit: 255
    t.string   "legacy_color",                 limit: 255
    t.string   "legacy_category",              limit: 255
    t.string   "received_from_system_guid",    limit: 255
    t.string   "reference",                    limit: 255
    t.boolean  "public_release",                             default: false
    t.integer  "old_acs_set_id",               limit: 4
    t.string   "alternative_id",               limit: 255
    t.boolean  "from_weather_map",                           default: false
    t.string   "portion_marking",              limit: 255
    t.boolean  "read_only",                                  default: false
    t.string   "title_c",                      limit: 255
    t.string   "description_c",                limit: 255
    t.string   "indicator_type_c",             limit: 255
    t.string   "dms_label_c",                  limit: 255
    t.string   "downgrade_request_id_c",       limit: 255
    t.string   "reference_c",                  limit: 255
    t.string   "alternative_id_c",             limit: 255
    t.string   "timelines",                    limit: 255
    t.string   "source_of_report",             limit: 255
    t.string   "target_of_attack",             limit: 255
    t.string   "target_scope",                 limit: 255
    t.string   "actor_attribution",            limit: 255
    t.string   "actor_type",                   limit: 255
    t.string   "modus_operandi",               limit: 255
    t.boolean  "is_ais",                                     default: false
    t.string   "observable_type",              limit: 255
    t.text     "observable_value",             limit: 65535
    t.text     "threat_actor_id",              limit: 65535
    t.text     "threat_actor_title",           limit: 65535
    t.datetime "start_time"
    t.string   "start_time_precision",         limit: 255
    t.datetime "end_time"
    t.string   "end_time_precision",           limit: 255
    t.boolean  "is_ciscp",                                   default: false
    t.boolean  "is_mifr",                                    default: false
    t.string   "feeds",                        limit: 255
    t.string   "parent_id",                    limit: 255
    t.string   "acs_set_id",                   limit: 255
  end

  add_index "stix_indicators", ["from_weather_map"], name: "index_stix_indicators_on_from_weather_map", using: :btree
  add_index "stix_indicators", ["guid"], name: "index_stix_indicators_on_guid", using: :btree
  add_index "stix_indicators", ["stix_id"], name: "index_stix_indicators_on_stix_id", using: :btree
  add_index "stix_indicators", ["updated_at"], name: "index_stix_indicators_on_updated_at", using: :btree

  create_table "stix_indicators_packages", force: :cascade do |t|
    t.string   "stix_package_id",   limit: 255
    t.string   "stix_indicator_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",              limit: 255
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "stix_indicators_packages", ["guid"], name: "index_stix_indicators_packages_on_guid", using: :btree
  add_index "stix_indicators_packages", ["stix_indicator_id"], name: "index_stix_indicators_packages_on_stix_indicator_id", using: :btree
  add_index "stix_indicators_packages", ["stix_package_id"], name: "index_stix_indicators_packages_on_stix_package_id", using: :btree

  create_table "stix_kill_chain_phases", force: :cascade do |t|
    t.string   "guid",                     limit: 255,                 null: false
    t.integer  "ordinality",               limit: 4
    t.string   "phase_name",               limit: 255,                 null: false
    t.string   "stix_kill_chain_id",       limit: 255,                 null: false
    t.string   "stix_kill_chain_phase_id", limit: 255,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                    default: false
  end

  add_index "stix_kill_chain_phases", ["stix_kill_chain_id"], name: "index_stix_kill_chain_phases_on_stix_kill_chain_id", using: :btree
  add_index "stix_kill_chain_phases", ["stix_kill_chain_phase_id"], name: "index_stix_kill_chain_phases_on_stix_kill_chain_phase_id", using: :btree

  create_table "stix_kill_chain_refs", force: :cascade do |t|
    t.string   "guid",                     limit: 255,                 null: false
    t.string   "stix_kill_chain_id",       limit: 255,                 null: false
    t.string   "stix_kill_chain_phase_id", limit: 255,                 null: false
    t.string   "remote_object_id",         limit: 255,                 null: false
    t.string   "remote_object_type",       limit: 255,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                    default: false
  end

  add_index "stix_kill_chain_refs", ["remote_object_id"], name: "index_stix_kill_chain_refs_on_remote_object_id", using: :btree

  create_table "stix_kill_chains", force: :cascade do |t|
    t.string   "definer",            limit: 255
    t.string   "guid",               limit: 255,                 null: false
    t.string   "kill_chain_name",    limit: 255,                 null: false
    t.string   "reference",          limit: 255
    t.string   "stix_kill_chain_id", limit: 255,                 null: false
    t.boolean  "is_default",                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",              default: false
  end

  add_index "stix_kill_chains", ["stix_kill_chain_id"], name: "index_stix_kill_chains_on_stix_kill_chain_id", using: :btree

  create_table "stix_markings", force: :cascade do |t|
    t.boolean  "is_reference",                             default: false, null: false
    t.string   "guid",                       limit: 255
    t.string   "old_marking_model_name",     limit: 255
    t.string   "old_marking_model_type",     limit: 255
    t.string   "old_marking_name",           limit: 255
    t.text     "old_marking_value",          limit: 65535
    t.string   "remote_object_id",           limit: 255
    t.string   "remote_object_type",         limit: 255
    t.string   "stix_id",                    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tlp_structure_id",           limit: 255
    t.string   "simple_structure_id",        limit: 255
    t.string   "isa_marking_structure_id",   limit: 255
    t.string   "isa_assertion_structure_id", limit: 255
    t.string   "remote_object_field",        limit: 255
    t.text     "controlled_structure",       limit: 65535
    t.boolean  "transfer_from_low",                        default: false
  end

  add_index "stix_markings", ["remote_object_id"], name: "index_stix_markings_on_remote_object_id", using: :btree
  add_index "stix_markings", ["stix_id"], name: "index_stix_markings_on_stix_id", using: :btree
  add_index "stix_markings", ["updated_at"], name: "index_stix_markings_on_updated_at", using: :btree

  create_table "stix_packages", force: :cascade do |t|
    t.datetime "created_at"
    t.text     "description",                  limit: 65535
    t.datetime "info_src_produced_time"
    t.boolean  "is_reference",                               default: false
    t.string   "package_intent",               limit: 255,   default: "Indicators"
    t.text     "short_description",            limit: 65535
    t.string   "stix_id",                      limit: 255
    t.datetime "stix_timestamp"
    t.string   "title",                        limit: 255
    t.datetime "updated_at"
    t.integer  "old_uploaded_file_id",         limit: 4
    t.string   "username",                     limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.string   "r5_container_type",            limit: 255
    t.integer  "r5_container_id",              limit: 4
    t.string   "guid",                         limit: 255
    t.string   "legacy_color",                 limit: 255
    t.string   "legacy_category",              limit: 255
    t.integer  "old_acs_set_id",               limit: 4
    t.string   "submission_mechanism",         limit: 255
    t.string   "portion_marking",              limit: 255
    t.boolean  "read_only",                                  default: false
    t.string   "title_c",                      limit: 255
    t.string   "description_c",                limit: 255
    t.string   "short_description_c",          limit: 255
    t.string   "package_intent_c",             limit: 255
    t.string   "produced_time_precision",      limit: 255
    t.boolean  "is_ciscp",                                   default: false
    t.string   "short_description_normalized", limit: 255
    t.boolean  "is_mifr",                                    default: false
    t.string   "feeds",                        limit: 255
    t.string   "src_feed",                     limit: 255
    t.string   "uploaded_file_id",             limit: 255
    t.string   "acs_set_id",                   limit: 255
  end

  add_index "stix_packages", ["guid"], name: "index_stix_packages_on_guid", using: :btree
  add_index "stix_packages", ["short_description_normalized"], name: "index_stix_packages_on_short_description_normalized", using: :btree
  add_index "stix_packages", ["stix_id"], name: "index_stix_packages_on_stix_id", using: :btree
  add_index "stix_packages", ["updated_at"], name: "index_stix_packages_on_updated_at", using: :btree

  create_table "stix_related_objects", force: :cascade do |t|
    t.string   "remote_dest_object_type",    limit: 255
    t.string   "remote_dest_object_guid",    limit: 255
    t.string   "remote_src_object_type",     limit: 255
    t.string   "remote_src_object_guid",     limit: 255
    t.string   "stix_information_source_id", limit: 255
    t.string   "relationship_type",          limit: 255
    t.string   "guid",                       limit: 255
    t.string   "created_by_user_guid",       limit: 255
    t.string   "updated_by_user_guid",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                      default: false
  end

  create_table "stix_sightings", force: :cascade do |t|
    t.text     "description",          limit: 65535
    t.datetime "sighted_at"
    t.string   "stix_indicator_id",    limit: 255
    t.string   "guid",                 limit: 255
    t.string   "user_guid",            limit: 255
    t.string   "sighted_at_precision", limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",                  default: false
  end

  add_index "stix_sightings", ["guid"], name: "index_stix_sightings_on_guid", using: :btree
  add_index "stix_sightings", ["stix_indicator_id"], name: "index_stix_sightings_on_stix_indicator_id", using: :btree

  create_table "system_logs", force: :cascade do |t|
    t.string   "stix_package_id",      limit: 255,   null: false
    t.string   "sanitized_package_id", limit: 255
    t.datetime "timestamp",                          null: false
    t.string   "source",               limit: 255,   null: false
    t.string   "log_level",            limit: 255,   null: false
    t.string   "message",              limit: 255,   null: false
    t.text     "text",                 limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_assignments", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.string   "remote_object_guid", limit: 255,                 null: false
    t.string   "remote_object_type", limit: 255,                 null: false
    t.string   "justification",      limit: 255
    t.integer  "tag_id",             limit: 4
    t.string   "tag_guid",           limit: 255,                 null: false
    t.string   "user_guid",          limit: 255
    t.string   "guid",               limit: 255
    t.string   "tag_type",           limit: 255
    t.boolean  "transfer_from_low",              default: false
  end

  add_index "tag_assignments", ["guid"], name: "index_tag_assignments_on_guid", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",              limit: 255,                 null: false
    t.string   "name_normalized",   limit: 255,                 null: false
    t.string   "user_guid",         limit: 255
    t.integer  "r5_collection_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",              limit: 255
    t.boolean  "is_permanent",                  default: false
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "tags", ["guid"], name: "index_tags_on_guid", using: :btree

  create_table "threat_actors", force: :cascade do |t|
    t.string   "title",                        limit: 255
    t.string   "title_c",                      limit: 255
    t.text     "description",                  limit: 65535
    t.string   "description_c",                limit: 255
    t.text     "short_description",            limit: 65535
    t.string   "short_description_c",          limit: 255
    t.string   "identity_name",                limit: 255
    t.string   "identity_name_c",              limit: 255
    t.string   "stix_id",                      limit: 255
    t.string   "portion_marking",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                         limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.integer  "old_acs_set_id",               limit: 4
    t.boolean  "read_only",                                  default: false
    t.boolean  "is_mifr",                                    default: false
    t.boolean  "is_ciscp",                                   default: false
    t.string   "feeds",                        limit: 255
    t.string   "acs_set_id",                   limit: 255
  end

  add_index "threat_actors", ["guid"], name: "index_threat_actors_on_guid", using: :btree
  add_index "threat_actors", ["stix_id"], name: "index_threat_actors_on_stix_id", using: :btree
  add_index "threat_actors", ["updated_at"], name: "index_threat_actors_on_updated_at", using: :btree

  create_table "tlp_structures", force: :cascade do |t|
    t.string   "color",             limit: 255,                 null: false
    t.string   "guid",              limit: 255,                 null: false
    t.string   "stix_id",           limit: 255,                 null: false
    t.string   "stix_marking_id",   limit: 255
    t.datetime "updated_at"
    t.boolean  "transfer_from_low",             default: false
  end

  create_table "ttp_attack_patterns", force: :cascade do |t|
    t.string   "stix_ttp_id",            limit: 255
    t.string   "stix_attack_pattern_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                   limit: 255
    t.string   "user_guid",              limit: 255
    t.boolean  "transfer_from_low",                  default: false
  end

  add_index "ttp_attack_patterns", ["guid"], name: "index_ttp_attack_patterns_on_guid", using: :btree
  add_index "ttp_attack_patterns", ["stix_attack_pattern_id"], name: "index_ttp_attack_patterns_on_stix_attack_pattern_id", using: :btree
  add_index "ttp_attack_patterns", ["stix_ttp_id"], name: "index_ttp_attack_patterns_on_stix_ttp_id", using: :btree

  create_table "ttp_exploit_targets", force: :cascade do |t|
    t.string   "stix_ttp_id",            limit: 255
    t.string   "stix_exploit_target_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                   limit: 255
    t.string   "user_guid",              limit: 255
    t.boolean  "transfer_from_low",                  default: false
  end

  add_index "ttp_exploit_targets", ["guid"], name: "index_ttp_exploit_targets_on_guid", using: :btree
  add_index "ttp_exploit_targets", ["stix_exploit_target_id"], name: "index_ttp_exploit_targets_on_stix_exploit_target_id", using: :btree
  add_index "ttp_exploit_targets", ["stix_ttp_id"], name: "index_ttp_exploit_targets_on_stix_ttp_id", using: :btree

  create_table "ttp_packages", force: :cascade do |t|
    t.string   "stix_ttp_id",       limit: 255
    t.string   "stix_package_id",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",              limit: 255
    t.string   "user_guid",         limit: 255
    t.boolean  "transfer_from_low",             default: false
  end

  add_index "ttp_packages", ["guid"], name: "index_ttp_packages_on_guid", using: :btree
  add_index "ttp_packages", ["stix_package_id"], name: "index_ttp_packages_on_stix_package_id", using: :btree
  add_index "ttp_packages", ["stix_ttp_id"], name: "index_ttp_packages_on_stix_ttp_id", using: :btree

  create_table "ttps", force: :cascade do |t|
    t.string   "stix_id",                      limit: 255
    t.string   "portion_marking",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                         limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.integer  "old_acs_set_id",               limit: 4
    t.datetime "stix_timestamp"
    t.boolean  "read_only",                                default: false
    t.boolean  "is_ciscp",                                 default: false
    t.boolean  "is_mifr",                                  default: false
    t.string   "feeds",                        limit: 255
    t.string   "acs_set_id",                   limit: 255
  end

  add_index "ttps", ["guid"], name: "index_ttps_on_guid", using: :btree
  add_index "ttps", ["stix_id"], name: "index_ttps_on_stix_id", using: :btree
  add_index "ttps", ["updated_at"], name: "index_ttps_on_updated_at", using: :btree

  create_table "uploaded_files", force: :cascade do |t|
    t.boolean  "is_attachment",                   default: false, null: false
    t.string   "file_name",           limit: 255,                 null: false
    t.integer  "file_size",           limit: 4
    t.string   "status",              limit: 1,   default: "N",   null: false
    t.boolean  "validate_only",                   default: false, null: false
    t.string   "user_guid",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                limit: 255
    t.boolean  "overwrite",                       default: false, null: false
    t.boolean  "human_review_needed",             default: false
    t.boolean  "read_only",                       default: false
    t.string   "portion_marking",     limit: 255
    t.string   "reference_title",     limit: 255
    t.string   "reference_number",    limit: 255
    t.string   "reference_link",      limit: 255
    t.boolean  "avp_validation"
    t.boolean  "avp_fail_continue"
    t.boolean  "avp_valid"
    t.string   "avp_message_id",      limit: 255
    t.string   "src_feed",            limit: 255
    t.string   "zip_status",          limit: 255
    t.boolean  "final",                           default: false
  end

  add_index "uploaded_files", ["guid"], name: "index_uploaded_files_on_guid", using: :btree
  add_index "uploaded_files", ["updated_at"], name: "index_uploaded_files_on_updated_at", using: :btree
  add_index "uploaded_files", ["user_guid"], name: "index_uploaded_files_on_user_guid", using: :btree

  create_table "user_sessions", force: :cascade do |t|
    t.string   "username",           limit: 255
    t.string   "session_id",         limit: 255
    t.datetime "session_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                 limit: 255
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.string   "email",                    limit: 255
    t.string   "phone",                    limit: 255
    t.string   "password_hash",            limit: 255
    t.string   "password_salt",            limit: 255
    t.string   "organization_guid",        limit: 255
    t.datetime "locked_at"
    t.datetime "logged_in_at"
    t.integer  "failed_login_attempts",    limit: 4,   default: 0
    t.datetime "expired_at"
    t.datetime "disabled_at"
    t.boolean  "password_change_required",             default: false
    t.datetime "password_changed_at"
    t.datetime "terms_accepted_at"
    t.datetime "hidden_at"
    t.integer  "throttle",                 limit: 4,   default: 0
    t.boolean  "machine",                              default: false
    t.integer  "r5_id",                    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_key",                  limit: 255
    t.string   "api_key_secret_encrypted", limit: 255
    t.string   "guid",                     limit: 255
    t.string   "notes",                    limit: 255
    t.string   "remote_guid",              limit: 255
    t.boolean  "transfer_from_low",                    default: false
  end

  add_index "users", ["guid"], name: "index_users_on_guid", using: :btree

  create_table "users_groups", force: :cascade do |t|
    t.integer  "group_id",      limit: 4
    t.string   "user_guid",     limit: 255
    t.integer  "created_by_id", limit: 4
    t.datetime "created_at"
    t.string   "guid",          limit: 255
  end

  add_index "users_groups", ["guid"], name: "index_users_groups_on_guid", using: :btree

  create_table "vulnerabilities", force: :cascade do |t|
    t.string   "title",                        limit: 255
    t.string   "title_c",                      limit: 255
    t.text     "description",                  limit: 65535
    t.string   "description_c",                limit: 255
    t.string   "cve_id",                       limit: 255
    t.string   "cve_id_c",                     limit: 255
    t.string   "osvdb_id",                     limit: 255
    t.string   "osvdb_id_c",                   limit: 255
    t.string   "portion_marking",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",                         limit: 255
    t.string   "created_by_user_guid",         limit: 255
    t.string   "updated_by_user_guid",         limit: 255
    t.string   "created_by_organization_guid", limit: 255
    t.string   "updated_by_organization_guid", limit: 255
    t.datetime "stix_timestamp"
    t.boolean  "read_only",                                  default: false
    t.string   "description_normalized",       limit: 255
    t.boolean  "is_mifr",                                    default: false
    t.boolean  "is_ciscp",                                   default: false
    t.string   "feeds",                        limit: 255
  end

  add_index "vulnerabilities", ["guid"], name: "index_vulnerabilities_on_guid", using: :btree
  add_index "vulnerabilities", ["updated_at"], name: "index_vulnerabilities_on_updated_at", using: :btree

  create_table "weather_map_images", force: :cascade do |t|
    t.string   "organization_token", limit: 255
    t.integer  "image_id",           limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weather_map_images", ["image_id"], name: "index_weather_map_images_on_image_id", using: :btree

end
