class CreateOwnerProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :owner_products do |t|
      t.integer :product_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
