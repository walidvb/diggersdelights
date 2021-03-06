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

ActiveRecord::Schema.define(version: 2020_05_08_213422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "clique_memberships", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "clique_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "clique_id"], name: "index_clique_memberships_on_user_id_and_clique_id", unique: true
  end

  create_table "cliques", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slack_url"
    t.index ["slug"], name: "index_cliques_on_slug", unique: true
  end

  create_table "contributions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "creative_session_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.string "avatar_url"
    t.string "skill_name"
    t.string "session_name"
    t.string "track_title"
    t.index ["creative_session_id"], name: "index_contributions_on_creative_session_id"
    t.index ["skill_id"], name: "index_contributions_on_skill_id"
    t.index ["user_id", "creative_session_id", "skill_id"], name: "index_contributions_on_skill_id_and_creative_session_id", unique: true
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "creative_sessions", force: :cascade do |t|
    t.bigint "track_id"
    t.string "session_token"
    t.string "readable_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.integer "declared_contributors_count"
    t.integer "participations_count", default: 0, null: false
    t.datetime "ended_at"
    t.string "track_title"
    t.index ["readable_id"], name: "index_creative_sessions_on_readable_id"
    t.index ["session_token"], name: "index_creative_sessions_on_session_token", unique: true
    t.index ["track_id"], name: "index_creative_sessions_on_track_id"
    t.index ["user_id"], name: "index_creative_sessions_on_user_id"
  end

  create_table "curated_list_links", id: :serial, force: :cascade do |t|
    t.integer "curated_list_id", null: false
    t.integer "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", default: 0
    t.index ["curated_list_id", "link_id"], name: "index_curated_list_links_on_curated_list_id_and_link_id", unique: true
    t.index ["curated_list_id"], name: "index_curated_list_links_on_curated_list_id"
    t.index ["link_id"], name: "index_curated_list_links_on_link_id"
  end

  create_table "curated_lists", id: :serial, force: :cascade do |t|
    t.string "source"
    t.string "url"
    t.string "host"
    t.string "title"
    t.string "description"
    t.string "image_url"
    t.string "site_name"
    t.integer "links_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "twitter_handle"
    t.boolean "private", default: true
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "devices", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token"
    t.string "model"
    t.string "os", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "app_version"
    t.index ["token"], name: "index_devices_on_token"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "email_invitations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.bigint "creative_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["creative_session_id"], name: "index_email_invitations_on_creative_session_id"
    t.index ["token"], name: "index_email_invitations_on_token"
    t.index ["user_id"], name: "index_email_invitations_on_user_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "link_clique_assignments", id: :serial, force: :cascade do |t|
    t.integer "clique_id"
    t.integer "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "visible", default: false
    t.string "played_by"
    t.string "heard_at"
    t.index ["clique_id"], name: "index_link_clique_assignments_on_clique_id"
    t.index ["link_id"], name: "index_link_clique_assignments_on_link_id"
  end

  create_table "links", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "oembed", default: "--- {}\n"
    t.text "description"
    t.boolean "published", default: true
    t.boolean "is_a_set", default: false
    t.integer "clique_id"
    t.integer "plays_count", default: 0
    t.integer "mood"
    t.boolean "oembeddable"
    t.string "title"
    t.string "mentions", default: [], array: true
    t.bigint "curated_list_id"
    t.index ["clique_id"], name: "index_links_on_clique_id"
    t.index ["curated_list_id"], name: "index_links_on_curated_list_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "system"
    t.string "text"
    t.string "messageable_type"
    t.bigint "messageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messageable_type", "messageable_id"], name: "index_messages_on_messageable_type_and_messageable_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "newsletters", id: :serial, force: :cascade do |t|
    t.string "email", null: false
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "target_id", null: false
    t.string "target_type", null: false
    t.integer "notifiable_id", null: false
    t.string "notifiable_type", null: false
    t.string "key", null: false
    t.integer "group_id"
    t.string "group_type"
    t.integer "group_owner_id"
    t.integer "notifier_id"
    t.string "notifier_type"
    t.text "parameters"
    t.datetime "opened_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_owner_id"], name: "index_notifications_on_group_owner_id"
    t.index ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id"
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "creative_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.bigint "track_id"
    t.string "track_title"
    t.string "session_readable_id"
    t.string "avatar_url"
    t.string "session_name"
    t.index ["creative_session_id"], name: "index_participations_on_creative_session_id"
    t.index ["track_id"], name: "index_participations_on_track_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "playlist_assignments", id: :serial, force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id", "link_id"], name: "index_playlist_assignments_on_playlist_id_and_link_id", unique: true
  end

  create_table "playlists", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "plays", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "profession"
    t.string "category"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "credit_section"
    t.index ["category"], name: "index_skills_on_category"
  end

  create_table "skills_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "skill_id", null: false
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.integer "target_id", null: false
    t.string "target_type", null: false
    t.string "key", null: false
    t.boolean "subscribing", default: true, null: false
    t.boolean "subscribing_to_email", default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text "optional_targets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_subscriptions_on_key"
    t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true
    t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id"
  end

  create_table "system_notifications", force: :cascade do |t|
    t.string "route"
    t.string "message"
    t.bigint "user_id"
    t.jsonb "metadata", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_system_notifications_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tagger_id"
    t.string "tagger_type"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "initials"
    t.index ["user_id"], name: "index_tracks_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.boolean "locked", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.string "auth_token", default: "asd", null: false
    t.string "initials"
    t.integer "plays_count", default: 0
    t.integer "link_clique_assignments_count", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "validations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "contribution_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contribution_id"], name: "index_validations_on_contribution_id"
    t.index ["status"], name: "index_validations_on_status"
    t.index ["user_id", "contribution_id"], name: "index_validations_on_user_id_and_contribution_id", unique: true
    t.index ["user_id"], name: "index_validations_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contributions", "creative_sessions"
  add_foreign_key "contributions", "skills"
  add_foreign_key "creative_sessions", "tracks"
  add_foreign_key "devices", "users"
  add_foreign_key "email_invitations", "creative_sessions"
  add_foreign_key "email_invitations", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "participations", "creative_sessions"
  add_foreign_key "validations", "contributions"
  add_foreign_key "validations", "users"
end
