class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :favorites, dependent: :destroy
   has_many :comments, dependent: :destroy

   validates :email, presence:true
   validates :name, presence:true
   validates :name, length: { maximum: 20 }
   validates :postcode, presence:true
   validates :address, presence:true
   validates :phone_number, presence:true
end