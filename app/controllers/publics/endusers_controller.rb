class Publics::EndusersController < Publics::ApplicationController

  def show
    @redelivery = Redelivery.new
    @comment = Comment.new
    @time_zones = TimeZone.all
  	@enduser = Enduser.find(params[:id])
      if @enduser.id != current_enduser.id
        redirect_to enduser_path(current_enduser.id)
      end
  	packages = Package.where(phone_number: @enduser.phone_number)
    @deliveries = []
  	packages.each do |a|
  		delivery = Delivery.find_by(package_id: a.id)
      @deliveries << delivery
  	end
  end

  def edit
    @enduser = Enduser.find(params[:id])
  end

  def update
    @enduser = Enduser.find(params[:id])
    enduser = Enduser.find(params[:id])
    if enduser.update(update_params)
      redirect_to enduser_path(params[:id]), flash: {comment_success: "ユーザー情報を編集しました"}
    else
      flash.now[:enduser_edit_error] = "編集できませんでした"
      render'edit'
    end
  end

  def destroy
    enduser = Enduser.find(params[:id])
    enduser.destroy
    redirect_to root_path
  end

private
  def update_params
    params.require(:enduser).permit(:email, :name, :postcode, :address, :phone_number)
  end
end

