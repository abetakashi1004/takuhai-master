class Drivers::DeliveriesController < Drivers::ApplicationController

  def new
  	@delivery = Delivery.new
  	@takeout = Takeout.where(delivery_person_id: current_delivery_person.id )
  	@completes = Takeout.where(delivery_person_id: current_delivery_person.id, status: 2 )
  	@backs = Takeout.where(delivery_person_id: current_delivery_person.id, status: 3 )
  	@yets = Takeout.where(delivery_person_id: current_delivery_person.id, status: 1 )
  end

  def create
  	@delivery = Delivery.new
  	@takeout = Takeout.where(delivery_person_id: current_delivery_person.id)
  	@completes = Takeout.where(delivery_person_id: current_delivery_person.id, status: 2)
  	@backs = Takeout.where(delivery_person_id: current_delivery_person.id, status: 3)
  	@yets = Takeout.where(delivery_person_id: current_delivery_person.id, status: 1)

  	delivery = Delivery.new(delivery_params)
  	current_slip_number = params[:delivery][:package_id]#荷物IDのフォームに伝票番号を入力させている為
	  	if Package.where(slip_number: current_slip_number).exists?#その伝票番号が存在するかどうか
		  	just_package = Package.find_by(slip_number: current_slip_number)#入力された伝票番号の荷物を特定
		  	if Takeout.where(package_id: just_package.id, delivery_person_id:current_delivery_person.id ).exists?#持ち出し登録しているかどうか
		  		if just_package.complete == false #配達未完了の荷物かどうか
				  	delivery.package_id = just_package.id
				  	delivery.save
				  	takeout = Takeout.find_by(package_id: just_package.id, delivery_person_id: current_delivery_person.id )
				  	if    params[:delivery][:status] == '配達完了' #配達完了なら、持ち出しテーブルのステータスを配達完了変更・荷物の完了カラムをtrueに
				  	      takeout.update(status:2)
				  	      just_package.update(complete: true)
				  	elsif params[:delivery][:status] == '不在'#不在なら、持ち出しテーブルのステータスを不在に変更・荷物の不在カラムをtrueに
				  	      takeout.update(status:3)
				  	      just_package.update(absence: true)#使わなくなったので消しても良い
				  	end
				  	redirect_to new_drivers_delivery_path
		  		else
			        flash.now[:not_delivery] = "配達完了報告しています"
			        render 'new'
		  		end
		    else
	        flash.now[:not_delivery] = "持ち出し登録がされていません"
	        render 'new'
		  	end
	  	else
	        flash.now[:not_delivery] = "その伝票番号は存在しません"
	        render 'new'
	  	end
  end

  def destroy
  	package = Package.find(params[:id])
  	delivery = Delivery.where(package_id: package.id).last
  	delivery.destroy
  	package.update(complete: false)
  	takeout = Takeout.find_by(package_id: package.id, delivery_person_id: current_delivery_person.id)
  	takeout.update(status: 1)
  	redirect_to drivers_takeouts_complete_path, flash: {delete_complete: "配達報告を取り消しました"}
  end

private
  def delivery_params
  	params.require(:delivery).permit(:delivery_person_id, :package_id, :status)
  end
end
