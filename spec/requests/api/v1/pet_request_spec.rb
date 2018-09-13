require 'rails_helper'

describe 'Pet requests' do
  it 'sends multiple pets info' do
    pets = create_list(:pet, 5)
    unavailable_pet = create(:pet, status: 1)

    get api_v1_pets_path

    info = JSON.parse(response.body)

    expect(response).to be_successful
    expect(info.count).to eq(6)
    expect(info.first['id']).to eq(pets.first.id)
    expect(info.first['name']).to eq(pets.first.name)
    expect(info.first['breed']).to eq(pets.first.breed)
    expect(info.first['age']).to eq(pets.first.age)
    expect(info.first['gender']).to eq(pets.first.gender)
    expect(info.first['description']).to eq(pets.first.description)
    expect(info.first['adoption_price']).to eq(pets.first.adoption_price.to_s)
    expect(info.first['store_id']).to eq(pets.first.store_id)

    expect(info.last['status']).to eq(unavailable_pet.status)
  end

  it 'sends pet info' do
    pet = create(:pet)

    get api_v1_pet_path(pet)

    info = JSON.parse(response.body)

    expect(response).to be_successful
    expect(info['id']).to eq(pet.id)
    expect(info['name']).to eq(pet.name)
    expect(info['breed']).to eq(pet.breed)
    expect(info['age']).to eq(pet.age)
    expect(info['gender']).to eq(pet.gender)
    expect(info['description']).to eq(pet.description)
    expect(info['adoption_price']).to eq(pet.adoption_price.to_s)
    expect(info['store_id']).to eq(pet.store_id)
  end
end
