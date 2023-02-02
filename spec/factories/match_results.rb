# frozen_string_literal: true

FactoryBot.define do
  factory :match_result do
    number_of_passes { 51 }
    number_of_goals { 0 }
    distance_covered { 11_112 }
  end
end
