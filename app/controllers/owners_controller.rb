class OwnersController < ApplicationController
  def index
  	@q = Owner.ransack(params[:q])
    @owners = @q.result(distinct: true).page(params[:page]).per(4)
  end
 
  def show
  	@owner = Owner.find(params[:id])
  	@products = Product.where(owner_id: @owner.id).page(params[:page]).per(8)
  	@post_comment = PostComment.new
  end


end
