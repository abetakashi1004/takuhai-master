class SalesOffice < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :postcodes
  has_many :delivery_people

  validates :email, presence:true
  validates :sales_office_name, presence:true
end
