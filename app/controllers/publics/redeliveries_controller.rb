class Publics::RedeliveriesController < ApplicationController

  def new
  	@redelivery = Redelivery.new
  end

  def create
  	redelivery = Redelivery.new(redelivery_params)
  	redelivery.save
  	redirect_to new_redelivery_path
  end

private
   def redelivery_params
   	params.require(:redelivery).permit(:package_id, :time_zone_id, :delivery_date)
   end
end
