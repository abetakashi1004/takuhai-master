class Postcode < ApplicationRecord
	has_many :packages
	has_one :course
end
