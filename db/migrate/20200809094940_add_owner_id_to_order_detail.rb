class AddOwnerIdToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :owner_id, :integer
  end
end
