class AddLongitudeToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :longitude, :float
  end
end
