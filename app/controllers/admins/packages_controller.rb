class Admins::PackagesController < ApplicationController
  def new
    @package = Package.new
    @package.build_phone_number
  end

  def create
    package = Package.new(package_params)
    package.save
    redirect_to admins_homes_path
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def package_params
    params.require(:package).permit(:shipper_id, :product_name_id, :postcode_id, :time_zone_id, :phone_number_id,
                                    :size_id, :slip_number, :destination, :address, :delivery_date, phone_number_attributes: [:phone_number])
  end

end
