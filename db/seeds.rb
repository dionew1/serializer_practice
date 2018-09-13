10.times do
 Store.create!(
    title: Faker::Company.name,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    base_adoption_fee: Faker::Commerce.price
 )
end


30.times do
  pet = Pet.create!(
    name: Faker::Dog.name,
    breed: Faker::Dog.breed,
    age: Faker::Dog.age,
    gender: Faker::Dog.gender,
    description: Faker::Lorem.paragraph,
    adoption_price:  Faker::Commerce.price,
    store: Store.find(rand(1..10))
   )
   Order.create(
     order_number: Faker::Bank.account_number,
     pet_id: pet.id,
     store_id: pet.store_id
   )
end
