class Admin::OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      flash[:notice] = "登録情報が更新されました。"
      redirect_to admin_owners_path
    else
    flash[:notice] = "項目を正しく記入してください"
    redirect_to request.referrer
    end
  end

  def destroy
  end

  private
  def owner_params
    params.require(:owner).permit(:name, :image,:category_id, :average_price, :postcode, :address, :phone_number, :password, :encrypted_password)
  end

end
