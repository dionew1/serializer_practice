require 'rails_helper'

describe 'Store requests' do
  it 'sends store info' do
    stores = create_list(:store, 4)

    get api_v1_stores_path

    info = JSON.parse(response.body)

    expect(response).to be_successful
    expect(info.count).to eq(4)
    expect(info.first['id']).to eq(stores.first.id)
    expect(info.first['title']).to eq(stores.first.title)
    expect(info.first['street']).to eq(stores.first.street)
    expect(info.first['city']).to eq(stores.first.city)
    expect(info.first['state']).to eq(stores.first.state)
    expect(info.first['zip']).to eq(stores.first.zip)
  end
end