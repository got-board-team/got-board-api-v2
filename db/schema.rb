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

ActiveRecord::Schema.define(version: 20170918012209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "blade_tracks", force: :cascade do |t|
    t.text "positions", default: ["greyjoy", "tyrell", "martell", "stark", "baratheon", "lannister"], null: false, array: true
    t.bigint "game_id"
    t.index ["game_id"], name: "index_blade_tracks_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round", default: 1, null: false
    t.integer "wildling_threat", default: 2, null: false
  end

  create_table "houses", force: :cascade do |t|
    t.string "name", null: false
    t.integer "blade_position", null: false
    t.integer "raven_position", null: false
    t.integer "throne_position", null: false
    t.integer "supply_position", null: false
    t.integer "victory_position", null: false
    t.bigint "game_id"
    t.bigint "blade_track_id"
    t.bigint "raven_track_id"
    t.bigint "throne_track_id"
    t.bigint "supply_track_id"
    t.bigint "victory_track_id"
    t.index ["blade_track_id"], name: "index_houses_on_blade_track_id"
    t.index ["game_id"], name: "index_houses_on_game_id"
    t.index ["name", "game_id"], name: "index_houses_on_name_and_game_id"
    t.index ["raven_track_id"], name: "index_houses_on_raven_track_id"
    t.index ["supply_track_id"], name: "index_houses_on_supply_track_id"
    t.index ["throne_track_id"], name: "index_houses_on_throne_track_id"
    t.index ["victory_track_id"], name: "index_houses_on_victory_track_id"
  end

  create_table "influence_tokens", force: :cascade do |t|
    t.integer "position", null: false
    t.string "influence_track_type"
    t.bigint "influence_track_id"
    t.bigint "house_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_influence_tokens_on_game_id"
    t.index ["house_id"], name: "index_influence_tokens_on_house_id"
    t.index ["influence_track_type", "influence_track_id"], name: "index_influence_tokens_on_track_id_and_type"
  end

  create_table "raven_tracks", force: :cascade do |t|
    t.text "positions", default: ["lannister", "stark", "martell", "baratheon", "tyrell", "greyjoy"], null: false, array: true
    t.bigint "game_id"
    t.index ["game_id"], name: "index_raven_tracks_on_game_id"
  end

  create_table "supply_tracks", force: :cascade do |t|
    t.bigint "game_id"
    t.json "positions", default: {"0"=>[], "1"=>["stark"], "2"=>["baratheon", "lannister", "greyjoy", "tyrell", "martell"], "3"=>[], "4"=>[], "5"=>[], "6"=>[]}, null: false
    t.index ["game_id"], name: "index_supply_tracks_on_game_id"
  end

  create_table "throne_tracks", force: :cascade do |t|
    t.text "positions", default: ["baratheon", "lannister", "stark", "martell", "greyjoy", "tyrell"], null: false, array: true
    t.bigint "game_id"
    t.index ["game_id"], name: "index_throne_tracks_on_game_id"
  end

  create_table "victory_tracks", force: :cascade do |t|
    t.bigint "game_id"
    t.json "positions", default: {"0"=>[], "1"=>["baratheon", "lannister", "greyjoy", "tyrell", "martell"], "2"=>["stark"], "3"=>[], "4"=>[], "5"=>[], "6"=>[]}, null: false
    t.index ["game_id"], name: "index_victory_tracks_on_game_id"
  end

end
