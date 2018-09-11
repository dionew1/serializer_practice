require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:breed)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:gender)}
    it {should validate_presence_of(:description)}
  end
  describe 'relationships' do
    it {should belong_to(:store)}
  end
end
