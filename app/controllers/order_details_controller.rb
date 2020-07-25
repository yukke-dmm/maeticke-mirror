class OrderDetailsController < ApplicationController
  def index
  	@orders = Order.where(user_id: current_user).page(params[:page])
  end

  def show
  	@order_detail = OrderDetail.find(params[:id])
  end

  def update
  	@order_detail = OrderDetail.find(params[:id])
  	i = @order_detail.ticket_count
  	  if i != 0
  	 	i = i - 1
  	  end
  	  # iに一度入れたものを戻す。チケットカウントにiを入れるよ。
  	@order_detail.ticket_count = i

  	@order_detail.update(order_detail_params)
  	redirect_to request.referrer
  end

private
  def order_detail_params
  	# requireを消すと通る
  	params.permit(:ticket_count)
  end

end
