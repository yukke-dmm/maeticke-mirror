class Owners::UsersController < ApplicationController
  def index
  end

  def show
  	@owner = current_owner
  end

  def edit
  	@owner = current_owner
  end

  def update
  	@owner = current_owner
  	if @owner.update(owner_params)
  	 	flash[:notice] = "登録情報が更新されました。"
  	 	redirect_to owners_user_path(current_owner)
    else
		flash[:notice] = "項目を正しく記入してください"
		redirect_to request.referrer
	end
  end


	private
	def owner_params
		params.require(:owner).permit(:name, :image,:category_id, :average_price, :postcode, :address, :phone_number, :password, :encrypted_password)
	end


end
