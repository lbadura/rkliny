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

ActiveRecord::Schema.define(version: 20180125230514) do

  create_table "groups", id: false, force: :cascade, options: "TYPE=InnoDB" do |t|
    t.string "id", null: false
    t.string "name", null: false
    t.integer "branch_office_id"
    t.string "book"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_groups_on_id", unique: true
  end

  create_table "marks", id: false, force: :cascade, options: "TYPE=InnoDB" do |t|
    t.string "id", null: false
    t.string "group_id", null: false
    t.string "lesson_id", null: false
    t.string "teacher_id", null: false
    t.boolean "test", default: false
    t.datetime "date"
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
