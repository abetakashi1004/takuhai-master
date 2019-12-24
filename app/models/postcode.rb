class Postcode < ApplicationRecord
	belongs_to :sales_office
	has_many :packages
	has_many :today_courses

	validates :postcode, presence:true
	validates :sales_office_id, presence:true
	validates :course_name, presence:true
end