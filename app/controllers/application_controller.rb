class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  	def after_sign_in_path_for(resource)
		if resource.is_a?(SalesOffice)
		  admins_homes_path
		elsif current_enduser
	      flash[:notice] = ""
	      homes_path  #　指定したいパスに変更
	    else
		  flash[:notice] = ""
	      homes_path  #　指定したいパスに変更
		end
	end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :level, :point,:address, :postcode, :face_photo, :password, :career, :email,:sales_office_id,:sales_office_name])
  end
end
