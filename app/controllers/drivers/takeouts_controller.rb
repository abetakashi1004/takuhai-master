class Drivers::TakeoutsController < ApplicationController

  def complete
    if params[:search].nil?#検索かかっているかどうか
      @completes = Takeout.where(delivery_person_id: current_delivery_person.id)
    else
      if params[:search] == ''#検索になにも入力しなかったとき
        @completes = Takeout.where(delivery_person_id: current_delivery_person.id)
      else#何か検索したとき
        @results = Package.search(params[:search])
        aaa = []
        @results.each do |result|
          aaa << result.id
        end
        @completes = []
        aaa.each do |a|
          takeout = Takeout.find_by(delivery_person_id: current_delivery_person.id, package_id: a)#検索に該当した荷物を持ち出ししているかどうか
          if takeout != nil #該当した荷物が持ち出していれば、＠completes に代入
            @completes << takeout
          end
        end
      end
    end
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

    @takeouts = Takeout.where(delivery_person_id: current_delivery_person.id)
    @redeliveries = Redelivery.all
    @change_dates = ChangeDate.all

    if params[:search].nil?
      @takeouts = Takeout.where(delivery_person_id: current_delivery_person.id)
    else
      if params[:search] == ''
        @takeouts = Takeout.where(delivery_person_id: current_delivery_person.id)
      else
        @results = Package.search(params[:search])
        aaa = []
        @results.each do |result|
         aaa << result.id
        end
        @takeouts = []
        aaa.each do |a|
          takeout = Takeout.find_by(delivery_person_id: current_delivery_person.id, package_id: a)
          if takeout != nil
            @takeouts << takeout
          end
        end
      end
     end
  end

  def update
  end

private
  def takeout_params
    params.require(:takeout).permit(:delivery_person_id, :package_id)
  end
end
