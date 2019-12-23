class Admins::DeliveryPeopleController < Admins::ApplicationController

  def index
    @delivery_people = DeliveryPerson.where(sales_office_id: current_sales_office.id)
  end

  def show
    @delivery_person = DeliveryPerson.find(params[:id])
    @comments = Comment.where(delivery_person_id: @delivery_person.id)
  end

  def edit
    @delivery_person = DeliveryPerson.find(params[:id])
  end

  def update
    @delivery_person = DeliveryPerson.find(params[:id])
    delivery_person = DeliveryPerson.find(params[:id])
    if delivery_person.update(delivery_person_params)
      redirect_to admins_delivery_person_path(delivery_person.id), flash: {admins_success: "ドライバー情報を編集しました"}
    else
      flash.now[:admins_error] = "編集できませんでした"
      render'edit'
    end
  end

  def destroy
    delivery_person = DeliveryPerson.find(params[:id])
    delivery_person.destroy
    redirect_to admins_delivery_people_path
  end

private
 def delivery_person_params
   params.require(:delivery_person).permit(:face_photo, :name, :career, :sales_office_id, :email)
 end
end