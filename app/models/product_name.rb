class ProductName < ApplicationRecord
	has_many :packages

	validates :product_name, presence:true
end
