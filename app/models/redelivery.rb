class Redelivery < ApplicationRecord
	belongs_to :package, optional: true
	belongs_to :time_zone, optional: true
end
