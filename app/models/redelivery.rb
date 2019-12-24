class Redelivery < ApplicationRecord
	belongs_to :package, optional: true
	belongs_to :time_zone, optional: true

	validates :package_id, presence:true
	validates :time_zone_id, presence:true
	validates :delivery_date, presence:true
end
