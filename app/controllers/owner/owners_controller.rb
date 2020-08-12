class Owner::OwnersController < ApplicationController
  before_action :authenticate_owner!
  def index
  end

  def show
    @owner = Owner.find(params[:id])
    @products = Product.where(owner_id: @owner.id)
    @post_comment = PostComment.new
  end

  def edit
  	@owner = current_owner　
  end

  def update
  	@owner = current_owner
  	if @owner.update(owner_params)
  	 	flash[:notice] = "登録情報が更新されました。"
  	 	redirect_to owner_owner_path(current_owner)
    else
		flash[:notice] = "項目を正しく記入してください"
		redirect_to request.referrer
	  end
  end

  def quit
    @owner = current_owner
  end

  def destroy
    @owner = current_owner
    @owner.destroy
    flash[:notice] = "退会しました"
    redirect_to owmer_homes_top_path
  end


	private
	def owner_params
		params.require(:owner).permit(:name, :image,:introduce,:category_id, :average_price, :postcode, :address, :phone_number, :longitude,:latitude,:password, :encrypted_password)
	end



end
