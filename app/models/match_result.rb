class MatchResult < ApplicationRecord
  belongs_to :match
  belongs_to :player
  has_and_belongs_to_many :achievements

  validates :number_of_goals, :number_of_passes, :distance_covered, presence: true
end
