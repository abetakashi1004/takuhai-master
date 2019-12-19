class Publics::RedeliveriesController < ApplicationController

  def new
  	@redelivery = Redelivery.new
  end

  def search
    @package = Package.search2(params[:search])
    @redelivery = Redelivery.new
    @time_zones = TimeZone.all
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
