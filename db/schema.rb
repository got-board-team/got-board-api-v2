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

ActiveRecord::Schema.define(version: 20170902030801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round", default: 1, null: false
    t.integer "wildling_threat", default: 2, null: false
    t.text "throne_track", default: ["baratheon", "lannister", "stark", "martell", "greyjoy", "tyrell"], null: false, array: true
    t.text "blade_track", default: ["greyjoy", "tyrell", "martell", "stark", "baratheon", "lannister"], null: false, array: true
    t.text "raven_track", default: ["lannister", "stark", "martell", "baratheon", "tyrell", "greyjoy"], null: false, array: true
    t.json "victory_track", default: {"0"=>[], "1"=>["baratheon", "lannister", "greyjoy", "tyrell", "martell"], "2"=>["stark"], "3"=>[], "4"=>[], "5"=>[], "6"=>[]}, null: false
    t.json "supply_track", default: {"0"=>[], "1"=>["stark"], "2"=>["baratheon", "lannister", "greyjoy", "tyrell", "martell"], "3"=>[], "4"=>[], "5"=>[], "6"=>[]}, null: false
  end

end
