class PhoneNumber < ApplicationRecord
	has_many :packages
	has_one :enduser
end
