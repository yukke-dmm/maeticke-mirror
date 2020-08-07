class Product < ApplicationRecord

    belongs_to :genre
    belongs_to :owner
    has_many :cart_items
    has_many :order_details, dependent: :destroy

    attachment :image

    has_many :favorites, dependent: :destroy
    # userのいいねが存在するかどうか
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
