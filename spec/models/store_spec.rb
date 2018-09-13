require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'validatations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:street)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
    it {should validate_length_of(:zip).is_at_least(5)}
    it {should validate_presence_of(:base_adoption_fee)}
    it {should validate_numericality_of(:base_adoption_fee).is_greater_than_or_equal_to(0)}
  end
  describe 'relationships' do
    it {should have_many(:pets)}
    it {should have_many(:orders)}
  end
end
