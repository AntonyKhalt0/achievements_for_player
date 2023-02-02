# frozen_string_literal: true

class CreateMatchesTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :matches_teams do |t|
      t.references :team, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
