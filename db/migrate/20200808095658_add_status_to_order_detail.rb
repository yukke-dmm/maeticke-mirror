class AddStatusToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :status, :boolean, default: false
  end
end
