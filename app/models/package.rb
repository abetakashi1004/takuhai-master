class Package < ApplicationRecord
	belongs_to :shipper
	belongs_to :product_name
	belongs_to :postcode
	belongs_to :time_zone
	belongs_to :size
	has_many :change_dates
	has_many :redeliveries
	has_many :deliveries
	has_many :takeouts

    validates :shipper_id, presence:true
    validates :product_name_id, presence:true
    validates :time_zone_id, presence:true
    validates :size_id, presence:true
    validates :slip_number, presence:true
    validates :slip_number, length: { maximum: 12 }
    validates :slip_number, length: { minimum: 12 }
    validates :destination, presence:true
    validates :address, presence:true
    validates :delivery_date, presence:true
    validates :phone_number, presence:true


    def self.search(search)
        if search
            Package.where(['destination LIKE ?', "%#{search}%"])
        else
            Package.all
        end
    end

    def self.search2(search)
        if search
            Package.find_by(slip_number: "#{search}")
        end
    end

    def self.search3(search)
        if search
            Package.where(phone_number: "#{search}")
        end
    end
end