class AddLatitudeToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :latitude, :float
  end
end
