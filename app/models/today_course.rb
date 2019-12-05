class TodayCourse < ApplicationRecord
	belongs_to :course
	belongs_to :delivery_person
end
