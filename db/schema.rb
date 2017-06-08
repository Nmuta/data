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

ActiveRecord::Schema.define(version: 20170608221345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campus", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campuses", id: false, force: :cascade do |t|
    t.integer  "id",         default: "nextval('campus_id_seq'::regclass)", null: false
    t.string   "name"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "emotions", force: :cascade do |t|
    t.string   "emotion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "emotion_id"
    t.datetime "logged_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "time_of_day"
    t.integer  "partner_id"
    t.string   "my_response"
    t.string   "notes"
    t.string   "secondary"
    t.string   "tertiary"
    t.string   "who_with"
  end

  create_table "fruits", force: :cascade do |t|
    t.string   "name"
    t.string   "region"
    t.integer  "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hair"
    t.string   "skin"
    t.integer  "facebase"
    t.integer  "earrings"
    t.integer  "glasses"
    t.integer  "moustache"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "hair_color"
  end

  create_table "responses", force: :cascade do |t|
    t.string   "name"
    t.integer  "emotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rogues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "talent"
  end

  create_table "secondaries", force: :cascade do |t|
    t.string   "name"
    t.integer  "emotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "songTitle"
    t.string   "songLength", limit: 6
    t.string   "comments"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tertiaries", force: :cascade do |t|
    t.string   "name"
    t.integer  "emotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tips", force: :cascade do |t|
    t.string   "tip"
    t.integer  "user_id"
    t.integer  "frequency"
    t.integer  "icon_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "tip_image_file_name"
    t.string   "tip_image_content_type"
    t.integer  "tip_image_file_size"
    t.datetime "tip_image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "campus_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "password"
  end

end
