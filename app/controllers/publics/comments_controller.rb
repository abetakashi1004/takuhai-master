class Publics::CommentsController < ApplicationController
	def create
		comment = Comment.new(comment_params)
		comment.save!
		redirect_to enduser_path(current_enduser.id)
	end
private
   def comment_params
   	params.require(:comment).permit(:comment, :enduser_id, :delivery_id)
   end
end
