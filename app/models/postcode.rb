class Postcode < ApplicationRecord
	belongs_to :sales_office
	has_many :packages
	has_many :today_courses
end
