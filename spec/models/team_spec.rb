require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_and_belong_to_many :matches }
  it { should have_many :players }

  it { should validate_presence_of :name }
end
