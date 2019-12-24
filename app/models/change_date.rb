class ChangeDate < ApplicationRecord
	belongs_to :package
	belongs_to :time_zone

	validates :package_id, presence:true
	validates :time_zone_id, presence:true
	validates :delivery_date, presence:true
end
