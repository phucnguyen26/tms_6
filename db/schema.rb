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

ActiveRecord::Schema.define(version: 20150112034200) do

  create_table "course_subjects", force: true do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.boolean  "status_subjects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id", using: :btree
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enroll_trainees", force: true do |t|
    t.integer  "enroll_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enroll_trainees", ["enroll_id"], name: "index_enroll_trainees_on_enroll_id", using: :btree
  add_index "enroll_trainees", ["user_id"], name: "index_enroll_trainees_on_user_id", using: :btree

  create_table "enrollments", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.boolean  "status_course"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "enrolls", force: true do |t|
    t.integer  "trainee_id"
    t.integer  "course_id"
    t.boolean  "status_course"
    t.boolean  "finished_course"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrolls", ["course_id"], name: "index_enrolls_on_course_id", using: :btree
  add_index "enrolls", ["trainee_id"], name: "index_enrolls_on_trainee_id", using: :btree

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["subject_id"], name: "index_lessons_on_subject_id", using: :btree

  create_table "results", force: true do |t|
    t.integer  "trainee_id"
    t.integer  "lesson_id"
    t.integer  "course_subjects_id"
    t.boolean  "status_lesson"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["course_subjects_id"], name: "index_results_on_course_subjects_id", using: :btree
  add_index "results", ["lesson_id"], name: "index_results_on_lesson_id", using: :btree
  add_index "results", ["trainee_id"], name: "index_results_on_trainee_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainees", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trainees", ["user_id"], name: "index_trainees_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_suppervisor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
  end

end
