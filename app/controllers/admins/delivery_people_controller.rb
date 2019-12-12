class Admins::DeliveryPeopleController < ApplicationController
  def index
    @delivery_people = DeliveryPerson.all
  end

  def show
    @delivery_person = DeliveryPerson.find(params[:id])
  end

  def edit
    @delivery_person = DeliveryPerson.find(params[:id])
  end

  def update
    delivery_person = DeliveryPerson.find(params[:id])
    delivery_person.update(delivery_person_params)
    redirect_to admins_delivery_person_path(delivery_person.id)
  end

  def destroy
  end

private
 def delivery_person_params
   params.require(:delivery_person).permit(:face_photo, :name, :career, :sales_office_id, :email)
 end
end
