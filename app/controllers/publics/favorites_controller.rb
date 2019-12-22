class Publics::FavoritesController < ApplicationController

	def create
		@favorite = Favorite.create(enduser_id: current_enduser.id, delivery_id: params[:favorite][:delivery_id], delivery_person_id: params[:favorite][:delivery_person_id])
		@aaa = Delivery.find(params[:favorite][:delivery_id])
	end

	def destroy
		favorite = Favorite.find_by(enduser_id: current_enduser.id, delivery_id: params[:favorite][:delivery_id])
        @aaa = Delivery.find(params[:favorite][:delivery_id])
		favorite.destroy
	end
end
