class Drivers::TakeoutsController < ApplicationController

  def complete
  end

  def new
    @takeout = Takeout.new
  end

  def create
    @takeout = Takeout.new
    takeout = Takeout.new(takeout_params)
    current_slip_number = params[:takeout][:package_id] #入力された伝票番号を左辺の変数におく
      if Package.where(slip_number: current_slip_number).exists? #その伝票番号が登録されている荷物が存在するかどうか
         just_package = Package.find_by(slip_number: current_slip_number)
         takeout.package_id = just_package.id
            if Takeout.where(package_id:just_package.id).exists? #すでに持ち出し登録しているかどうか
              flash.now[:not_takeout] = "すでに持ち出し登録しています"
              render 'new'
            else
              takeout.save
              redirect_to new_drivers_takeout_path
            end
      else
        flash.now[:not_takeout] = "その伝票番号は存在しません"
        render 'new'
      end
  end

  def index
  end

  def update
  end

private
  def takeout_params
    params.require(:takeout).permit(:delivery_person_id, :package_id)
  end
end
