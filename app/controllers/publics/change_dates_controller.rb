class Publics::ChangeDatesController < ApplicationController

  def new
  	@change_date = ChangeDate.new
  end

  def search
    @packages = Package.search3(params[:search])
    @change_date = ChangeDate.new
    @time_zones = TimeZone.all
  end

  def create
  	change_date = ChangeDate.new(cange_date_params)
  	change_date.save
  	redirect_to new_change_date_path
  end

private
   def cange_date_params
   	params.require(:change_date).permit(:package_id, :time_zone_id, :delivery_date)
   end
end
