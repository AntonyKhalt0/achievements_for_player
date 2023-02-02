# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :first_achive_count, default: 0
      t.integer :second_achive_count, default: 0
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
