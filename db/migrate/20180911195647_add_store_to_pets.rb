class AddStoreToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :store, foreign_key: true
  end
end
