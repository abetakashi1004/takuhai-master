class Drivers::TakeoutsController < Drivers::ApplicationController

  def complete
    if params[:search].nil?#検索かかっているかどうか
      @completes = Takeout.where(delivery_person_id: current_delivery_person.id)
    else
      if params[:search] == ''#検索になにも入力しなかったとき
        @completes = Takeout.where(delivery_person_id: current_delivery_person.id)
      else
        #検索して該当した荷物たちの中で自分が持ち出し登録している荷物のみを@completesに入れる
        @results = Package.search(params[:search])
        aaa = []
        @results.each do |result|
          aaa << result.id
        end
        @completes = []
        aaa.each do |a|
          takeout = Takeout.find_by(delivery_person_id: current_delivery_person.id, package_id: a)
          if takeout != nil
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
         if just_package.complete == false #配達未完了の荷物かどうか
            if Takeout.where(package_id:just_package.id, delivery_person_id:current_delivery_person.id).exists? #すでに持ち出し登録しているかどうか
              flash.now[:not_takeout] = "すでに持ち出し登録しています"
              render 'new'
            else
              takeout.save
              redirect_to new_drivers_takeout_path, flash: {takeout_complete: "持ち出し登録しました"}
            end
         else
          flash.now[:not_takeout] = "配達完了報告しています"
          render 'new'
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

    if params[:search].nil?#検索かかっているかどうか
      @takeouts = Takeout.where(delivery_person_id: current_delivery_person.id)
    else
      if params[:search] == ''#検索になにも入力しなかったとき
        @takeouts = Takeout.where(delivery_person_id: current_delivery_person.id)
      else
        #検索して該当した荷物たちの中で自分が持ち出し登録している荷物のみを@takeoutsに入れる
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
