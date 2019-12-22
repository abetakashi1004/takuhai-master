class Admins::CommentsController < ApplicationController

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		delivery_person = comment.delivery_person.id
		redirect_to admins_delivery_person_path(delivery_person)
	end
end
