class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @user =  User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会させました"
    redirect_to admin_users_path
  end
end
