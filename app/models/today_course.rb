class TodayCourse < ApplicationRecord
	belongs_to :postcode
	belongs_to :delivery_person
end
