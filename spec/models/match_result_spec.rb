# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MatchResult, type: :model do
  it { should belong_to :match }
  it { should belong_to :player }
  it { should have_and_belong_to_many :achievements }

  it { should validate_presence_of :number_of_passes }
  it { should validate_presence_of :number_of_goals }
  it { should validate_presence_of :distance_covered }
end
