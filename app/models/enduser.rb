class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :favorites
   has_many :comments

	def favorite_enduser(enduser_id)
		favorites.find_by(enduser_id: enduser_id)
	end

end
