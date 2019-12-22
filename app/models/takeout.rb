class Takeout < ApplicationRecord
	belongs_to :delivery_person
	belongs_to :package

	validates :delivery_person_id, presence:true
	validates :package_id, presence:true
	validates :status, presence:true
end