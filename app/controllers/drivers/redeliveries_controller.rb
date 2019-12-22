class Drivers::RedeliveriesController < Drivers::ApplicationController
	def update
		redelivery = Redelivery.find(params[:id])
		redelivery.update_attributes(redelivery_params)
		redirect_to drivers_takeouts_path
	end

private
    def redelivery_params
    	params.require(:redelivery).permit(:check)
    end
end
