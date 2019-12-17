class Drivers::DeliveryPeopleController < ApplicationController
  def show
  	@delivery_person = DeliveryPerson.find(params[:id])
  end
end
