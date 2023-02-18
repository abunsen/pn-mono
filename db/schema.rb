# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_01_035756) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "billing_ledgers", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "event_name"
    t.json "properties"
    t.decimal "amount"
    t.integer "payment_method_id", null: false
    t.integer "issued_pass_id", null: false
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_billing_ledgers_on_account_id"
    t.index ["issued_pass_id"], name: "index_billing_ledgers_on_issued_pass_id"
    t.index ["payment_method_id"], name: "index_billing_ledgers_on_payment_method_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_groups_on_account_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_invoices_on_account_id"
  end

  create_table "issued_pass_values", force: :cascade do |t|
    t.integer "issued_pass_id", null: false
    t.string "path"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issued_pass_id"], name: "index_issued_pass_values_on_issued_pass_id"
  end

  create_table "issued_passes", force: :cascade do |t|
    t.integer "pass_template_id", null: false
    t.datetime "issue_date"
    t.datetime "install_date"
    t.string "install_ip"
    t.string "install_user_agent"
    t.string "delivered_via"
    t.datetime "delivered_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pass_template_id"], name: "index_issued_passes_on_pass_template_id"
  end

  create_table "pass_events", force: :cascade do |t|
    t.integer "issued_pass_id", null: false
    t.string "event_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issued_pass_id"], name: "index_pass_events_on_issued_pass_id"
  end

  create_table "pass_template_fields", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "path"
    t.string "default_value"
    t.integer "pass_template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pass_template_id"], name: "index_pass_template_fields_on_pass_template_id"
  end

  create_table "pass_templates", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "platform"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_pass_templates_on_account_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "kind"
    t.string "last_4"
    t.string "ex_id"
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_payment_methods_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "billing_ledgers", "accounts"
  add_foreign_key "billing_ledgers", "issued_passes"
  add_foreign_key "billing_ledgers", "payment_methods"
  add_foreign_key "groups", "accounts"
  add_foreign_key "invoices", "accounts"
  add_foreign_key "issued_pass_values", "issued_passes"
  add_foreign_key "issued_passes", "pass_templates"
  add_foreign_key "pass_events", "issued_passes"
  add_foreign_key "pass_template_fields", "pass_templates"
  add_foreign_key "pass_templates", "accounts"
  add_foreign_key "payment_methods", "accounts"
end
