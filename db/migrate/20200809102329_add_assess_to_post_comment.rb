class AddAssessToPostComment < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :assess, :float
  end
end
