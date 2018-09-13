class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :title
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.decimal  :base_adoption_fee

      t.timestamps
    end
  end
end
