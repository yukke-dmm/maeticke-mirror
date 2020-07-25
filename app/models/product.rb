class Product < ApplicationRecord

    belongs_to :genre
    belongs_to :owner
    has_many :cart_items
    has_many :order_details, dependent: :destroy

    attachment :image

end
