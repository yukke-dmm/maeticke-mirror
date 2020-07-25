class OrdersController < ApplicationController
  def new
  	@order = Order.new
  end

  def index
  	@order = Order.new(order_params)
    @user = current_user
    @cart_item = @user.cart_items.all
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
       @cart_items = current_user.cart_items
       @cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.ticket_count = cart_item.count
        order_detail.price = cart_item.product.price * cart_item.count
        order_detail.order_id = @order.id
        order_detail.product_id = cart_item.product_id
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to orders_fin_path
    else
      @order = Order.new
      render :new
    end
  end

  def fin
  end
end

    def order_params
      params.require(:order).permit(:user_id, :payment_method, :payment)
    end