class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :genres
  belongs_to :category

# これを入れ忘れていて店舗の画像が表示されてなかった。
  attachment :image

# 論理削除
  acts_as_paranoid
end
