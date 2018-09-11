class Store < ApplicationRecord
  validates :zip, length: {minimum: 5}
  validates_presence_of :title,
                        :street,
                        :city,
                        :state,
                        :zip

  has_many :pets
end
