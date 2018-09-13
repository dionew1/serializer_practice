class Pet < ApplicationRecord
  validates :adoption_price, numericality: {greater_than_or_equal_to: 0}
  validates_presence_of :name,
                        :breed,
                        :age,
                        :gender,
                        :description,
                        :adoption_price
  belongs_to :store
end
