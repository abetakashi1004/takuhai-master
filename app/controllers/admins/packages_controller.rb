class Admins::PackagesController < Admins::ApplicationController

  def new
    @package = Package.new
  end

  def create
    @package = Package.new
    package = Package.new(package_params)
    if Package.where(slip_number: params[:package][:slip_number]).exists?
      flash.now[:admins_error] = "その伝票番号はすでに登録済みです"
      render'new'
    else
      if package.save
        redirect_to admins_packages_path
      else
        flash.now[:admins_error] = "登録できませんでした"
        render'new'
      end
    end
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
    @package = Package.find(params[:id])
    package = Package.find(params[:id])
    if package.update(package_params)
      redirect_to admins_package_path(package.id)
    else
      flash.now[:admins_error] = "編集できませんでした"
      render'edit'
    end
  end

  def destroy
    package = Package.find(params[:id])
    package.destroy
    redirect_to admins_packages_path, flash: {admins_success: "荷物を削除しました"}
  end

private
  def package_params
    params.require(:package).permit(:shipper_id, :product_name_id, :postcode_id, :time_zone_id, :phone_number_id,
                                    :size_id, :slip_number, :destination, :address, :delivery_date, :phone_number)
  end
end
