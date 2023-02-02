# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :title, null: false
      t.integer :first_command_score, null: false, default: 0
      t.integer :second_command_score, null: false, default: 0

      t.timestamps
    end
  end
end
