class Achievement < ApplicationRecord
  has_and_belongs_to_many :match_results
  has_many :players, through: :match_results
  has_many :matches, through: :match_results

  validates :title, :rule, presence: true
end
