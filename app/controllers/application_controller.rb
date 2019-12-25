class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  	def after_sign_in_path_for(resource)
		if resource.is_a?(SalesOffice)
		  admins_homes_path
		elsif resource.is_a?(DeliveryPerson)
	      new_drivers_today_course_path
	    else
	      homes_path
		end
	end

  	def after_sign_out_path_for(resource)
		if resource.is_a?(SalesOffice)
		  new_sales_office_session_path
		elsif resource.is_a?(DeliveryPerson)
	      new_delivery_person_session_path
	    else
	      homes_path
		end
	end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone_number, :level, :point,:address, :postcode, :face_photo, :password, :career, :email,:sales_office_id,:sales_office_name])
  end
end
