class PostCommentsController < ApplicationController
  def create
    owner = Owner.find(params[:owner_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.owner_id = owner.id
    comment.save
    redirect_to owner_path(owner)  end

  def destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
