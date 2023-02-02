# frozen_string_literal: true

class Match < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :match_results
  has_many :players, through: :match_results
  has_many :achievements, through: :match_results

  validates :title, :first_command_score, :second_command_score, presence: true
end
