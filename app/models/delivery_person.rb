class DeliveryPerson < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :sales_office
  has_many :today_courses
  has_many :takeouts
  has_many :deliveries

  attachment :face_photo
end
