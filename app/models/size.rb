class Size < ApplicationRecord
	has_many :packages

	validates :size, presence:true
end
