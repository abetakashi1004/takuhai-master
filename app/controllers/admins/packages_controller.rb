class Admins::PackagesController < Admins::ApplicationController
  def new
    @package = Package.new
  end

  def create
    package = Package.new(package_params)
    package.save
    redirect_to admins_homes_path
  end

  def index
    @packages = Package.search(params[:search])
    @packages = @packages.page(params[:page]).order(id: "DESC")
  end

  def show
    @package = Package.find(params[:id])
    @change_dates = ChangeDate.where(package_id: @package.id)
    @redeliveries = Redelivery.where(package_id: @package.id)
    @deliveries = Delivery.where(package_id: @package.id)
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    package = Package.find(params[:id])
    package.update(package_params)
    redirect_to admins_package_path(package.id)
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
