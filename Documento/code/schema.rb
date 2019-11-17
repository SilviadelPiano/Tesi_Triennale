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

ActiveRecord::Schema.define(version: 20191014161620) do

  create_table "children", force: :cascade do |t|
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_id"
    t.index ["child_id"], name: "index_children_on_child_id"
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "schoolClass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schoolClass_id"], name: "index_memberships_on_schoolClass_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "link"
    t.date "deadline"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "school_class_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "school_classes", force: :cascade do |t|
    t.string "name"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "school_classes_teachers", force: :cascade do |t|
    t.integer "school_class_id", limit: 8
    t.integer "teacher_id", limit: 8
    t.string "subject"
    t.index ["school_class_id"], name: "index_school_classes_teachers_on_school_class_id"
    t.index ["teacher_id"], name: "index_school_classes_teachers_on_teacher_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roles_mask"
    t.string "name", default: "", null: false
    t.string "surname", default: "", null: false
    t.string "birth_place", default: "", null: false
    t.date "birth_date", default: "2019-09-04", null: false
    t.string "sex", default: "", null: false
    t.string "CF", default: "", null: false
    t.index ["CF"], name: "index_users_on_CF", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
