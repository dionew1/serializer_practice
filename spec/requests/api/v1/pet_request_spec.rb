require 'rails_helper'

describe 'Pet requests' do
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
    expect(info['store_id']).to eq(pet.store_id)
  end
end
