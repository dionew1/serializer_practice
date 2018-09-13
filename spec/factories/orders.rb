FactoryBot.define do
  factory :order do
    order_number { Faker::Bank.account_number }
    store
    pet
  end
end
