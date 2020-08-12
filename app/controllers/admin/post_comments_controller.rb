class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def create
    owner = Owner.find(params[:owner_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.owner_id = owner.id
    comment.save
    redirect_to owner_path(owner)
  end

  def destroy
    PostComment.find_by(id: params[:id], owner_id: params[:owner_id]).destroy
    redirect_to admin_owners_path(params[:owner_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment,:assess)
  end

end
