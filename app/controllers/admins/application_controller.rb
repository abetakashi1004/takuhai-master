class Admins::ApplicationController < ApplicationController
	before_action :authenticate_sales_office!
end
