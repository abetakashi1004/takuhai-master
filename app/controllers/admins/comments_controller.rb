class Admins::CommentsController < ApplicationController

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		delivery_person_id = comment.delivery_person.id
		redirect_to admins_delivery_person_path(delivery_person_id), flash: { admins_success: "コメントを削除しました"}
	end
end
