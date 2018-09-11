10.times do
 Store.create!(
    title: Faker::Company.name,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip
 )
end


30.times do
 Pet.create!(
  name: Faker::Dog.name,
  breed: Faker::Dog.breed,
  age: Faker::Dog.age,
  gender: Faker::Dog.gender,
  description: Faker::Lorem.paragraph,
  store: Store.find(rand(1..10))
 )
end
