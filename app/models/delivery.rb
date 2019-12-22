class Delivery < ApplicationRecord
	belongs_to :delivery_person
	belongs_to :package
	has_many :favorites
	has_many :comments
	enum status: { 配達完了: 1, 不在: 2}

end
