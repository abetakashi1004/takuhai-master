class Publics::EndusersController < ApplicationController

  def show
    @redelivery = Redelivery.new
    @comment = Comment.new
    @time_zones = TimeZone.all
  	@enduser = Enduser.find(params[:id])
  	aaa = []
  	packages = Package.where(phone_number: @enduser.phone_number)
  	packages.each do |a|
  		@deliveries = Delivery.where(package_id: a.id)
  	end
  end

  def edit
    @enduser = Enduser.find(params[:id])
  end

  def update
    enduser = Enduser.find(params[:id])
    enduser.update(update_params)
    redirect_to enduser_path(params[:id])
  end

  def destroy
  end

private
  def update_params
    params.require(:enduser).permit(:email, :name, :postcode, :address, :phone_number)
  end
end
