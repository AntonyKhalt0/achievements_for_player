# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_201_170_419) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'achievements', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'rule', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'achievements_match_results', force: :cascade do |t|
    t.bigint 'match_result_id'
    t.bigint 'achievement_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['achievement_id'], name: 'index_achievements_match_results_on_achievement_id'
    t.index ['match_result_id'], name: 'index_achievements_match_results_on_match_result_id'
  end

  create_table 'match_results', force: :cascade do |t|
    t.integer 'number_of_passes', default: 0
    t.integer 'number_of_goals', default: 0
    t.integer 'distance_covered', default: 0
    t.bigint 'match_id'
    t.bigint 'player_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['match_id'], name: 'index_match_results_on_match_id'
    t.index ['player_id'], name: 'index_match_results_on_player_id'
  end

  create_table 'matches', force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'first_command_score', default: 0, null: false
    t.integer 'second_command_score', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'matches_teams', force: :cascade do |t|
    t.bigint 'team_id'
    t.bigint 'match_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['match_id'], name: 'index_matches_teams_on_match_id'
    t.index ['team_id'], name: 'index_matches_teams_on_team_id'
  end

  create_table 'players', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.integer 'first_achive_count', default: 0
    t.integer 'second_achive_count', default: 0
    t.bigint 'team_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['team_id'], name: 'index_players_on_team_id'
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'achievements_match_results', 'achievements'
  add_foreign_key 'achievements_match_results', 'match_results'
  add_foreign_key 'match_results', 'matches'
  add_foreign_key 'match_results', 'players'
  add_foreign_key 'matches_teams', 'matches'
  add_foreign_key 'matches_teams', 'teams'
  add_foreign_key 'players', 'teams'
end
