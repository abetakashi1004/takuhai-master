class ChangeDate < ApplicationRecord
	belongs_to :package
	belongs_to :time_zone
end
