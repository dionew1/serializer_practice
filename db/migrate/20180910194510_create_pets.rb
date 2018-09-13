class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string  :name
      t.string  :breed
      t.string  :age
      t.string  :gender
      t.text    :description
      t.decimal :adoption_price

      t.timestamps
    end
  end
end
