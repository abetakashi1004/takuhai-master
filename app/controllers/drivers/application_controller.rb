class Drivers::ApplicationController < ApplicationController
	before_action :authenticate_delivery_person!
end
