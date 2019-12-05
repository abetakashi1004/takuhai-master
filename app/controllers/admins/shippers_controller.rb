class Admins::ShippersController < ApplicationController

  def new
  	@shipper = Shipper.new
  end

  def create
  	shipper = Shipper.new(shipper_params)
  	shipper.save
  	redirect_to admins_homes_path
  end

private
	def shipper_params
		params.require(:shipper).permit(:shipper_name, :postcode, :address, :phone_number)
	end
end
