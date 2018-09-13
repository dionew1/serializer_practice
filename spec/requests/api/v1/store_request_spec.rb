require 'rails_helper'

describe 'Store requests' do
  it 'sends multiple stores info' do
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
    expect(info.first['base_adoption_fee']).to eq(stores.first.base_adoption_fee.to_s)
  end

  it "sends a single store's info" do
    stores = create_list(:store, 4)

    get api_v1_store_path(stores.first)

    info = JSON.parse(response.body)

    expect(response).to be_successful
    expect(info['id']).to eq(stores.first.id)
    expect(info['title']).to eq(stores.first.title)
    expect(info['street']).to eq(stores.first.street)
    expect(info['city']).to eq(stores.first.city)
    expect(info['state']).to eq(stores.first.state)
    expect(info['zip']).to eq(stores.first.zip)
    expect(info['base_adoption_fee']).to eq(stores.first.base_adoption_fee.to_s)
  end

  it "sends orders for a store" do
    store = create(:store)
    order_1 = create(:order, store: store)
    order_2 = create(:order, store: store)
    order_3 = create(:order)

    get api_v1_store_orders_path(store)

    info = JSON.parse(response.body)

    expect(info.count).to eq(2)
    expect(info.first['id']).to eq(order_1.id)
    expect(info.first['pet_id']).to eq(order_1.pet_id)
    expect(info.first['total_price']).to eq(order_1.total_price.to_s)
  end

  it "sends a single order's info for a store" do
    store = create(:store)
    order_1 = create(:order, store: store)
    order_2 = create(:order)

    get api_v1_store_order_path(store, order_1)

    info = JSON.parse(response.body)

    expect(response).to be_successful
    expect(info['id']).to eq(order_1.id)
    expect(info['pet_id']).to eq(order_1.pet_id)
    expect(info['total_price']).to eq(order_1.total_price.to_s)
  end

  it "sends a 404 if order is not associated to store" do
    store = create(:store)
    order_1 = create(:order, store: store)
    order_2 = create(:order)

    get api_v1_store_order_path(store, order_2)
    
    expect(response.status).to eq(404)
  end
end
