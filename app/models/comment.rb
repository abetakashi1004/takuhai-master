class Comment < ApplicationRecord
	belongs_to :enduser
	belongs_to :delivery
	belongs_to :delivery_person

	validates :enduser_id, presence:true
	validates :delivery_id, presence:true
	validates :comment, presence:true
	validates :comment, length: { maximum: 150 }
	validates :delivery_person_id, presence:true
end