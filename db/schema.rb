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

ActiveRecord::Schema.define(version: 2019_04_14_173129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "edition"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "director_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_participations", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "color"
    t.index ["match_id"], name: "index_match_participations_on_match_id"
    t.index ["participant_id"], name: "index_match_participations_on_participant_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "kifu"
    t.integer "handicap"
    t.string "winner"
    t.string "victory_condition"
    t.bigint "location_id"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_matches_on_league_id"
    t.index ["location_id"], name: "index_matches_on_location_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "rank"
    t.integer "score", default: 0
    t.bigint "player_id"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_participants_on_league_id"
    t.index ["player_id"], name: "index_participants_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.string "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
  end

  add_foreign_key "match_participations", "matches"
  add_foreign_key "match_participations", "participants"
  add_foreign_key "matches", "leagues"
  add_foreign_key "matches", "locations"
  add_foreign_key "participants", "leagues"
  add_foreign_key "participants", "players"
end
