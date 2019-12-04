class Admins::ShippersController < ApplicationController

  def new
  	@shipper = Shipper.new
  end

  def create
  	shipper = Shipper.new(shipper_params)
  	shipper.save
  	redirect_to new_admins_shipper_path
  end

private
	def shipper_params
		params.require(:shipper).permit(:shipper_name, :postcode, :address, :phone_number)
	end
end
