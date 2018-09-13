require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:breed) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:adoption_price) }
    it { should validate_numericality_of(:adoption_price).is_greater_than_or_equal_to(0) }
  end
  describe 'relationships' do
    it { should belong_to(:store) }
  end
end
