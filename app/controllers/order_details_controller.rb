class OrderDetailsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@orders = Order.where(user_id: current_user).page(params[:page])
    # idを持ってくるようになぜかしていた
    @order_details = OrderDetail.all
    time = Time.now
    # もし期限を過ぎたら表示は販売停止になるよ
    @order_details.each do |order_detail|
      if (order_detail.created_at+order_detail.product.limit.days) < time && order_detail.status == false
        order_detail.status = true
        order_detail.save
      end
    end
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
