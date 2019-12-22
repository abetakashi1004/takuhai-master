class Drivers::DeliveryPeopleController < Drivers::ApplicationController
  def show
  	@delivery_person = DeliveryPerson.find(params[:id])
  	@comments = Comment.where(delivery_person_id: @delivery_person.id)
  end
end
