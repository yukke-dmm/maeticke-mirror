class OwnersController < ApplicationController
  def index
  	@q = Owner.ransack(params[:q])
    @owners = @q.result(distinct: true)
  end

  def show
  	@owner = Owner.find(params[:id])
  	@products = Product.where(owner_id: @owner.id)
  	@post_comment = PostComment.new
  end


end
