class AddLimitToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :limit, :integer
  end
end
