class TodayCourse < ApplicationRecord
	belongs_to :postcode
	belongs_to :delivery_person

	validates :delivery_person_id, presence:true
	validates :postcode_id, presence:true
end