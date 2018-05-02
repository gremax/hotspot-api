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

ActiveRecord::Schema.define(version: 2018_05_02_154456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "subdomain", null: false
    t.string "name", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdomain"], name: "index_accounts_on_subdomain", unique: true
  end

  create_table "actions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "current", default: false, null: false
    t.string "name", null: false
    t.string "entity_uid"
    t.string "entity_name"
    t.text "post_text"
    t.string "post_link"
    t.string "post_image"
    t.string "redirect_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "provider_id"
    t.index ["provider_id"], name: "index_actions_on_provider_id"
  end

  create_table "admins", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: true, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "admins_roles", id: false, force: :cascade do |t|
    t.uuid "admin_id"
    t.bigint "role_id"
    t.index ["admin_id", "role_id"], name: "index_admins_roles_on_admin_id_and_role_id"
    t.index ["admin_id"], name: "index_admins_roles_on_admin_id"
    t.index ["role_id"], name: "index_admins_roles_on_role_id"
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "owner_id", null: false
    t.boolean "active", default: true, null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id"
    t.string "name", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_places_on_company_id"
  end

  create_table "providers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "company_id"
    t.string "name", null: false
    t.string "api_key"
    t.string "api_secret"
    t.string "api_public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_providers_on_company_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.uuid "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "routers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "place_id"
    t.string "name", null: false
    t.string "username", null: false
    t.string "password", null: false
    t.string "status"
    t.datetime "last_pinged_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_routers_on_place_id"
  end

  add_foreign_key "actions", "providers"
  add_foreign_key "companies", "admins", column: "owner_id"
  add_foreign_key "places", "companies"
  add_foreign_key "providers", "companies"
  add_foreign_key "routers", "places"
end
