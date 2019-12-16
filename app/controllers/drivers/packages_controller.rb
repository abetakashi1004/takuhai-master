class Drivers::PackagesController < ApplicationController
  def show
    @package = Package.find(params[:id])
    @change_dates = ChangeDate.where(package_id: @package.id)
    @redeliveries = Redelivery.where(package_id: @package.id)
    @deliveries = Delivery.where(package_id: @package.id)
  end
end
