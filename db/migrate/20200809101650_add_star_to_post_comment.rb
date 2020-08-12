class AddStarToPostComment < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :Star, :float
  end
end
