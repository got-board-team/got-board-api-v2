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

ActiveRecord::Schema.define(version: 20180722181853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round", default: 1, null: false
    t.integer "wildling_threat", default: 2, null: false
  end

  create_table "garrison_tokens", force: :cascade do |t|
    t.string "name", null: false
    t.string "territory", null: false
    t.integer "x"
    t.integer "y"
    t.bigint "game_id"
    t.bigint "house_id"
    t.index ["game_id"], name: "index_garrison_tokens_on_game_id"
    t.index ["house_id"], name: "index_garrison_tokens_on_house_id"
  end

  create_table "house_cards", force: :cascade do |t|
    t.string "name"
    t.bigint "game_id"
    t.bigint "house_id"
    t.index ["game_id"], name: "index_house_cards_on_game_id"
    t.index ["house_id"], name: "index_house_cards_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_houses_on_game_id"
    t.index ["name", "game_id"], name: "index_houses_on_name_and_game_id"
  end

  create_table "neutral_force_tokens", force: :cascade do |t|
    t.string "territory", null: false
    t.bigint "game_id"
    t.string "player_range"
    t.integer "strength", default: 0, null: false
    t.integer "x", default: 0, null: false
    t.integer "y", default: 0, null: false
    t.boolean "defeated", default: false, null: false
    t.index ["game_id"], name: "index_neutral_force_tokens_on_game_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "x", default: 0, null: false
    t.integer "y", default: 0, null: false
    t.integer "strength"
    t.string "territory"
    t.string "type"
    t.boolean "special", null: false
    t.boolean "revealed"
    t.bigint "game_id"
    t.bigint "house_id"
    t.index ["game_id"], name: "index_orders_on_game_id"
    t.index ["house_id"], name: "index_orders_on_house_id"
  end

  create_table "power_tokens", force: :cascade do |t|
    t.string "territory"
    t.boolean "available", default: false, null: false
    t.bigint "house_id"
    t.bigint "game_id"
    t.integer "x", default: 0, null: false
    t.integer "y", default: 0, null: false
    t.index ["game_id"], name: "index_power_tokens_on_game_id"
    t.index ["house_id"], name: "index_power_tokens_on_house_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "position", null: false
    t.string "type"
    t.bigint "house_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "x", default: 0, null: false
    t.integer "y", default: 0, null: false
    t.index ["game_id"], name: "index_tokens_on_game_id"
    t.index ["house_id"], name: "index_tokens_on_house_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "x", default: 0, null: false
    t.integer "y", default: 0, null: false
    t.boolean "routed", default: false, null: false
    t.string "territory"
    t.string "type"
    t.bigint "game_id"
    t.bigint "house_id"
    t.index ["game_id"], name: "index_units_on_game_id"
    t.index ["house_id"], name: "index_units_on_house_id"
  end

  create_table "wildling_cards", force: :cascade do |t|
    t.string "name"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_wildling_cards_on_game_id"
  end

end
