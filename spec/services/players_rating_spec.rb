# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayersRating do
  it 'displays the top of all players' do
    rule = 'scored_at_least_two_goals'
    expect(described_class.new.overall_top_players(rule).first.first_name).to eq('Лионель')
    expect(described_class.new.overall_top_players(rule).second.first_name).to eq('Винисиус')
  end

  it 'displays the top players of the team' do
    rule = 'run_more_10000_meters'
    team = 'ПСЖ'
    expect(described_class.new.team_top_players(rule, team).first.first_name).to eq('Килиаy')
  end
end
