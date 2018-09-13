class Order < ApplicationRecord
  validates_presence_of :order_number
  belongs_to :store
  belongs_to :pet

  before_create :calculate_total

  private
    def calculate_total
      self.total_price = store.base_adoption_fee + pet.adoption_price
    end
end
