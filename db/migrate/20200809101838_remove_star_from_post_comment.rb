class RemoveStarFromPostComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_comments, :Star, :float
  end
end
