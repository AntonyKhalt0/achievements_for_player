class CreateAchievementsMatchResults< ActiveRecord::Migration[7.0]
  def change
    create_table :achievements_match_results do |t|
      t.references :match_result, foreign_key: true
      t.references :achievement, foreign_key: true

      t.timestamps
    end
  end
end
