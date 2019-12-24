class Admins::ShippersController < Admins::ApplicationController

  def new
  	@shipper = Shipper.new
  end

  def create
    @shipper = Shipper.new
  	shipper = Shipper.new(shipper_params)
  	if shipper.save
      redirect_to admins_homes_path
    else
      flash.now[:admins_error] = "登録できませんでした"
      render'new'
    end
  end

private
	def shipper_params
		params.require(:shipper).permit(:shipper_name, :postcode, :address, :phone_number)
	end
end
