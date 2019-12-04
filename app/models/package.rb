class Package < ApplicationRecord
	belongs_to :shipper
	belongs_to :product_name
	belongs_to :postcode
	belongs_to :time_zone
	belongs_to :phone_number
	belongs_to :size
	has_many :change_dates
	has_many :redeliveries
	has_many :deliveries
	has_many :takeouts
end
