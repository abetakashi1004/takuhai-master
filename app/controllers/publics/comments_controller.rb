class Publics::CommentsController < Publics::ApplicationController

	def create
		comment = Comment.new(comment_params)
		if comment.save
			redirect_to enduser_path(current_enduser.id), flash: {comment_success: "コメントを送信しました"}
		else
			redirect_to enduser_path(current_enduser.id), flash: {comment_error: "コメントに失敗しました"}
		end
	end
private
   def comment_params
   	params.require(:comment).permit(:comment, :enduser_id, :delivery_id, :delivery_person_id)
   end
end
