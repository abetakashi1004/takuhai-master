class TimeZone < ApplicationRecord
	has_many :change_dates
	has_many :redeliveries
end
