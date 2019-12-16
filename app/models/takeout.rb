class Takeout < ApplicationRecord
	belongs_to :delivery_person
	belongs_to :package

    def self.search(search)
        if search
            Package.where(['destination LIKE ?', "%#{search}%"])
        else
        	
        end
    end
end
