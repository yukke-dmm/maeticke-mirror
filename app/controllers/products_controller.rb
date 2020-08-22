class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.page(params[:page]).per(12)
    # .result(distinct: true)

    if params[:q].present?
    # 検索フォームからアクセスした時の処理
      @serch = Product.ransack(params[:q])
      @products = @serch.result(distinct: true).page(params[:page]).per(12)
    else
    # 検索フォーム以外からアクセスした時の処理
      params[:q] = { sorts: 'id desc' }
      @serch = Product.ransack(params[:sorts])
      @products = Product.all.page(params[:page]).per(12)
    end
  end

  def search
    #   if params[:q].present?
    # # 検索フォームからアクセスした時の処理
    #   @search = product.ransack(search_params)
    #   @products = @search.result
    # else
    # # 検索フォーム以外からアクセスした時の処理
    #   params[:q] = { sorts: 'id desc' }
    #   @search = product.ransack()
    #   @products = product.all
    # end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
      if @product.save
      flash[:notice] = "successfully"
      redirect_to owners_product_path
      else
        render :new
      end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      flash[:notice] = "登録情報が更新されました。"
      redirect_to owners_product_path
    else
      redirect_to request.referrer
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :introduce, :image_id, :price, :genre_id, :product_status, :delete_flag)
    end
 
    def search_params
    params.require(:q).permit(:sorts)
    # 他のパラメーターもここに入れる
    end
end
