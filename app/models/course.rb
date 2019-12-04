class Course < ApplicationRecord
	belongs_to :postcode
	belongs_to :sales_office
	has_many :today_courses
end
