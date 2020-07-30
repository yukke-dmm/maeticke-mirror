class UsersController < ApplicationController
  def quit
  	@user = current_user
  end

  def destroy
  	@user = current_user
  	@user.destroy
  	flash[:notice] = "退会しました"
    redirect_to homes_top_path
  end
end
