class AddStatusToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :status, :integer, default: 0
  end
end
