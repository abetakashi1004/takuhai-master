class Takeout < ApplicationRecord
	belongs_to :delivery_person
	belongs_to :package
end
