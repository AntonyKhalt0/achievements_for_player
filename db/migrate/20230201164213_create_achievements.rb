# frozen_string_literal: true

class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.string :title, null: false
      t.string :rule, null: false

      t.timestamps
    end
  end
end
