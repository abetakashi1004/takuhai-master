class Drivers::DeliveryPeopleController < Drivers::ApplicationController

  def show
  	@delivery_person = DeliveryPerson.find(params[:id])
  	 if @delivery_person.id != current_delivery_person.id
  	 	redirect_to drivers_delivery_person_path(current_delivery_person.id)
  	 end
  	@comments = Comment.where(delivery_person_id: @delivery_person.id)
  end
end
