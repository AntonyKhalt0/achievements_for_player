# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to :team }
  it { should have_many :match_results }
  it { should have_many :matches }
  it { should have_many :achievements }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :achievements_score }

  describe '.got_an_achievement?' do
    it 'true' do
      player = Player.second
      achievement = Achievement.second
      expect(player.got_an_achievement?(achievement)).to eq true
    end
  end
end
