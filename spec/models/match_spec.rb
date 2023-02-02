require 'rails_helper'

RSpec.describe Match, type: :model do
  it { should have_and_belong_to_many :teams }
  it { should have_many :match_results }
  it { should have_many :players }
  it { should have_many :achievements }

  it { should validate_presence_of :title }
  it { should validate_presence_of :first_command_score }
  it { should validate_presence_of :second_command_score }
end
