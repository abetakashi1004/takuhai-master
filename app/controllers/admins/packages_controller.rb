class Admins::PackagesController < ApplicationController
  def new
    @package = Package.new
  end

  def create
    package = Package.new(package_params)
    package.save
    redirect_to admins_homes_path
  end

  def index
    @packages = Package.search(params[:search]).order(id: "DESC")
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    package = Package.find(params[:id])
    package.destroy
    redirect_to admins_packages_path
  end

private
  def package_params
    params.require(:package).permit(:shipper_id, :product_name_id, :postcode_id, :time_zone_id, :phone_number_id,
                                    :size_id, :slip_number, :destination, :address, :delivery_date, :phone_number)
  end

end
