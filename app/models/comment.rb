class Comment < ApplicationRecord
	belongs_to :enduser
	belongs_to :delivery
	belongs_to :delivery_person
end
