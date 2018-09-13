FactoryBot.define do
  factory :store do
    title { Faker::Company.name }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    base_adoption_fee { Faker::Commerce.price }
  end
end
