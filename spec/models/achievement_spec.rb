# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Achievement, type: :model do
  it { should have_and_belong_to_many :match_results }
  it { should have_many :players }
  it { should have_many :matches }

  it { should validate_presence_of :title }
  it { should validate_presence_of :rule }
end
