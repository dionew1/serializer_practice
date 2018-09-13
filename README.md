# README

### Versions
- Ruby 2.4.1
- Rails 5.2.1

### Purpose
The purpose of this repo is to practice using a serializer in an existing API.

### Setup
After forking and/or cloning this project please run the following commands from the command line:
- `rake db:{create,migrate,seed}`
- `rspec` All tests should be passing

### End Points

`/api/v1/pets`: returns a list of all pets and their attributes

`/api/v1/pets/:id`: returns a single pet by id and its attributes

`/api/v1/stores`: returns a list of all pets and their attributes

`/api/v1/stores/:id`: returns a single store by id and its attributes

`api/v1/stores/:store_id/orders`: returns orders associated to a single stores

`api/v1/stores/:store_id/orders/:id`: returns a single orders by id associated to a single store

### Adding a Serializer
1. Add `gem 'active_model_serializers'` to the Gemfile above `group :development, :test do`
1. To generate the serializer folder and file in the command line run
   `rails g serializer <insert name of the model>` ex. `rails g serializer pet`

### What do I put in a Serializer?
A serializer is a great way to format a JSON response within the serializer we can do a few things:
1. Tell it which attributes to use
```ruby
# serializers/pet_serializer.rb
class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :age, :gender, :status
end
```

1. Add a relationship to display the info for that relationship
```ruby
# serializers/pet_serializer.rb
class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :age, :gender, :status

  belongs_to :store
end
```

1. Add a custom field
```ruby
# serializers/pet_serializer.rb
class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :age, :gender, :status, :total_price_to_adopt

  belongs_to :store

  def total_price_to_adopt
    (object.store.base_adoption_fee + object.adoption_price).round(2)
  end
end
```

To see the changes to the JSON response start your local server from the command line: `rails s`

Then visit one of the above end points for pet

### Try it

- Create a serializer for a store with the following:
  - Display the following attributes: title, street, city, state
  - Add associated orders
  - Add associated pets
  - Add a count of orders per store
  - Add an average total price of orders per store
  - Add a count of the pets that have a status of available per store
