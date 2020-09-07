class AddStatusToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :status, :boolean ,default: false
  end
end
