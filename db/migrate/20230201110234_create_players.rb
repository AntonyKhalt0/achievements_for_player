# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.jsonb :achievements_score, null: false, default: { run_more_10000_meters: 0, scored_at_least_two_goals: 0 }
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
