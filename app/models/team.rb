# frozen_string_literal: true

class Team < ApplicationRecord
  has_and_belongs_to_many :matches
  has_many :players

  validates :name, presence: true

  def top_players(rule)
    Player.order(first_achive_count: :desc).limit(5) if rule == 'run_more_10000_meters'
    Player.order(second_achive_count: :desc).limit(5) if rule == 'scored_at_least_two_goals'
  end
end
