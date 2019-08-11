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

ActiveRecord::Schema.define(version: 2019_08_11_075538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklist_option_due_times", force: :cascade do |t|
    t.datetime "date", default: "2019-08-11 13:32:37", null: false
    t.bigint "checklist_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_option_id"], name: "index_checklist_option_due_times_on_checklist_option_id"
  end

  create_table "checklist_options", force: :cascade do |t|
    t.text "text", null: false
    t.boolean "checked", default: false, null: false
    t.bigint "checklist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_checklist_options_on_checklist_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_checklists_on_ticket_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "ticket_content_type"
    t.bigint "ticket_content_id"
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_content_type", "ticket_content_id"], name: "index_contents_on_ticket_content_type_and_ticket_content_id"
    t.index ["ticket_id"], name: "index_contents_on_ticket_id"
  end

  create_table "due_times", force: :cascade do |t|
    t.datetime "date", default: "2019-08-11 13:32:37", null: false
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_due_times_on_ticket_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "workspace_id"
    t.index ["workspace_id"], name: "index_folders_on_workspace_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "workspace_item_type"
    t.bigint "workspace_item_id"
    t.bigint "workspace_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", null: false
    t.index ["workspace_id"], name: "index_items_on_workspace_id"
    t.index ["workspace_item_type", "workspace_item_id"], name: "index_items_on_workspace_item_type_and_workspace_item_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", default: "#000000", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_notes_on_ticket_id"
  end

  create_table "ticket_folders", force: :cascade do |t|
    t.bigint "ticket_id"
    t.bigint "folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folder_id"], name: "index_ticket_folders_on_folder_id"
    t.index ["ticket_id"], name: "index_ticket_folders_on_ticket_id"
  end

  create_table "ticket_labels", force: :cascade do |t|
    t.bigint "ticket_id"
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_ticket_labels_on_label_id"
    t.index ["ticket_id"], name: "index_ticket_labels_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "folder_id"
    t.integer "position_in_folder"
    t.bigint "workspace_id"
    t.index ["folder_id"], name: "index_tickets_on_folder_id"
    t.index ["workspace_id"], name: "index_tickets_on_workspace_id"
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "checklist_option_due_times", "checklist_options"
  add_foreign_key "checklist_options", "checklists"
  add_foreign_key "checklists", "tickets"
  add_foreign_key "contents", "tickets"
  add_foreign_key "due_times", "tickets"
  add_foreign_key "folders", "workspaces"
  add_foreign_key "items", "workspaces"
  add_foreign_key "notes", "tickets"
  add_foreign_key "ticket_folders", "folders"
  add_foreign_key "ticket_folders", "tickets"
  add_foreign_key "ticket_labels", "labels"
  add_foreign_key "ticket_labels", "tickets"
  add_foreign_key "tickets", "folders"
  add_foreign_key "tickets", "workspaces"
end
