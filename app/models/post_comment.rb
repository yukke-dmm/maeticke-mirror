class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :owner

# rateは数字のみ許可するよ。１〜５までだよ
  validates :assess, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
