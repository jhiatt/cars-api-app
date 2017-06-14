class AddOwnerIdToCar < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :owner_id, :integer
  end
end
