class Drivers::ChangeDatesController < ApplicationController

	def update
		change_date = ChangeDate.find(params[:id])
		change_date.update_attributes(change_date_params)
		redirect_to drivers_takeouts_path
	end

private
    def change_date_params
    	params.require(:change_date).permit(:check)
    end
end
