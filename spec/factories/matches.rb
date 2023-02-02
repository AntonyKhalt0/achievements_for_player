# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    title { 'A | B' }
    first_command_score { 0 }
    second_command_score { 0 }
  end
end
