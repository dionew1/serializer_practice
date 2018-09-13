require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:order_number) }
    it 'should calculate total before create' do
      order = create(:order)
      expect(order.total_price).to_not be_nil
    end
  end

  describe 'relationships' do
    it { should belong_to(:store) }
    it { should belong_to(:pet) }
  end
end
