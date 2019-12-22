class DeliveryPerson < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :sales_office
  has_many :today_courses
  has_many :takeouts
  has_many :deliveries
  has_many :favorites , through: :deliveries
  has_many :comments , through: :deliveries
  attachment :face_photo

  validates :email, presence:true
  validates :sales_office_id, presence:true
  validates :name, presence:true
  validates :name, length: { maximum: 20 }
  validates :face_photo_id, presence:true
  validates :career, presence:true

  def favorite_count(delivery_person_id)
  	deliveries.where(delivery_person_id: delivery_person_id)
  end
  def commment_count(delivery_person_id)
  	deliveries.where(delivery_person_id: delivery_person_id)
  end
end