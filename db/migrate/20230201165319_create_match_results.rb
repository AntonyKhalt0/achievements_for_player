# frozen_string_literal: true

class CreateMatchResults < ActiveRecord::Migration[7.0]
  def change
    create_table :match_results do |t|
      t.integer :number_of_passes, default: 0
      t.integer :number_of_goals, default: 0
      t.integer :distance_covered, default: 0
      t.references :match, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
