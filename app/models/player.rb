# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team
  has_many :match_results
  has_many :matches, through: :match_results
  has_many :achievements, through: :match_results

  validates :first_name, :last_name, :achievements_score, presence: true

  def got_an_achievement?(achievement)
    MatchResult.joins(:player, :achievements).where(player: self,
                                                    achievements: achievement).order(created_at: :desc).limit(5).exists?
  end
end
