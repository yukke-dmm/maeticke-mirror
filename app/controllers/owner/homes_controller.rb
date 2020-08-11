class Owner::HomesController < ApplicationController
  before_action :authenticate_owner!
  def top
    # @order_detail = OrderDetail.where(owner_id: current_owner.id)

    # プロダクトテーブルからオーナーidで商品を取り出す
    @products = Product.where(owner_id: current_owner.id).page(params[:page]).per(10)
    #  order_detailを初期化。オーダーディテイルの中身が入る予定だよ。nillを回避
    @order_detail = OrderDetail.none
    # SQLのwhere_query(ウェアー句)を設定するための文字列の初期化
    where_query = ""
    @products.each_with_index do | product, i |
      where_query +="product_id = " + product.id.to_s
      if i < @products.length - 1
         where_query += " or "
      end
    end
    # 空っぽじゃないなら
    if where_query != ""
      @order_detail = OrderDetail.where(where_query)
    end

    # start_date = Time.current.beginning_of_month
    # end_date = Time.current.end_of_month
    # @profits = @order_detail.product.price.sum(:price start_date..end_date)
  end

  def about
  end
end
