class Publics::ApplicationController < ApplicationController
	before_action :authenticate_enduser!
end
