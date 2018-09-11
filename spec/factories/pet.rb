FactoryBot.define do
  factory :pet do
    name {Faker::Dog.name}
    breed {Faker::Dog.breed}
    age {Faker::Dog.age}
    gender {Faker::Dog.gender}
    description {Faker::Lorem.paragraph}

    store
  end
end
