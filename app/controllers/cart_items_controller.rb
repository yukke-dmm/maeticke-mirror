class CartItemsController < ApplicationController
    before_action :authenticate_user!
    def index
      @cart_item = CartItem.new
      @cart_items = CartItem.where(user_id: current_user)
    end


    def create
      # カートアイテムに格納されたプロダクトidを持ってくるよ
      @product = Product.find(params[:cart_item][:product_id])
      # もし空欄じゃなかったら
        if current_user.cart_items.where(product_id: @product.id) != []
          @cart_items = current_user.cart_items.where(product_id: @product.id)
          # 最初のレコードを返すよ
          @cart_item = @cart_items.first
          # 最初のレコードのカウントは、最初のレコードのカウントにさらに購入した分足したものだよ。
          @cart_item.count += params[:cart_item][:count].to_i
          @cart_item.save
        else
          @cart = CartItem.new(cart_item_params)
          @cart.save
        end
          redirect_to cart_items_path
    end

    def update
      @cart_item = CartItem.find(params[:id])
      @cart_item.count = params[:cart_item][:count]
        @cart_item.save
      redirect_to cart_items_path
    end

    def destroy
      # チーム開発でメンバーが＠cartっていう変数を作ってやっていたけど謎だから変更
      @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
      redirect_back(fallback_location: cart_items_path)
    end

    def destroy_all
      @user = User.find(current_user.id)
      if @user.cart_items.destroy_all
        flash[:notice] = "カートの商品を全て削除しました"
        redirect_back(fallback_location: cart_items_path)
      else
        render 'cart_items_path'
      end

    end

    private

    def cart_item_params
      params.require(:cart_item).permit(:user_id, :product_id, :price, :count)
    end

end
 