class Shipper < ApplicationRecord
	has_many :packages

	validates :shipper_name, presence:true
	validates :postcode, presence:true
	validates :address, presence:true
	validates :phone_number, presence:true
end
