# frozen_string_literal: true

FactoryBot.define do
  factory :achievement do
    title { 'Пробежал 5 км' }
    rule { 'run_more_5000_meters' }
  end
end
