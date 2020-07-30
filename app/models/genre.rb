class Genre < ApplicationRecord
	has_many :products
    belongs_to :owner
end
