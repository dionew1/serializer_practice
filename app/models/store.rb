class Store < ApplicationRecord
  validates :zip, length: {minimum: 5}
  validates :base_adoption_fee, numericality: {greater_than_or_equal_to: 0}
  validates_presence_of :title,
                        :street,
                        :city,
                        :state,
                        :zip,
                        :base_adoption_fee
  has_many :pets
end
