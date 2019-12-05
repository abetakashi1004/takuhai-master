class Delivery < ApplicationRecord
	belongs_to :delivery_person
	belongs_to :package
	has_many :favorites
	has_many :comments
end
