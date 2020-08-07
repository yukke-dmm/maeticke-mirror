class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#住所の経度緯度を登録してくれるよ（geocoder）
  geocoded_by :address
  after_validation :geocode, if: :address_changed?



  has_many :products
  has_many :genres
  has_many :post_comments, dependent: :destroy
  belongs_to :category

# これを入れ忘れていて店舗の画像が表示されてなかった。
  attachment :image

# 論理削除
  acts_as_paranoid


end
