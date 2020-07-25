class OwnersController < ApplicationController
  def index
  	@owners = Owner.all
  end

  def show
  	@owner = Owner.find(params[:id])
  	@products = Product.where(owner_id: @owner.id)
  end


end
