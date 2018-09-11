class Pet < ApplicationRecord
  validates_presence_of :name,
                        :breed,
                        :age,
                        :gender,
                        :description
  belongs_to :store
end
