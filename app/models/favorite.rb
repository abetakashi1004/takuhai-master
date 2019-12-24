class Favorite < ApplicationRecord
 	belongs_to :enduser
	belongs_to :delivery
	belongs_to :delivery_person

    validates :enduser_id, presence:true
    validates :delivery_id, presence:true
    validates :delivery_person_id, presence:true
end