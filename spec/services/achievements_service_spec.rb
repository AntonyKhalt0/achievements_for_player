# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AchievementsService do
  it 'successful verification of achievement' do
    player = Player.second
    match_result = MatchResult.joins(:player).where(player: { first_name: player.first_name }).second
    expect(described_class.new(match_result).call.first.class).to eq(Achievement)
  end
end
