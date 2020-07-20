class Owners::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # # @products = @owner.products
    # @owner = Owner.find(current_owner.id)
     @products = Product.where(owner_id: current_owner.id).page(params[:page])
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
  	@product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    # この商品のオーナーIDカラムにはログインオーナーのIDを入れるよ
    @product.owner_id = current_owner.id
      if @product.save
      flash[:notice] = "successfully"
      redirect_to owners_product_path(@product.id)
      else
        # ロールバックしたときにエラーメッセージが出る記述
    #     @product.errors.full_messages.each do |message|
    #     p message
    # 　   end
        render :new
      end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
      if @product.update
        flash[:notice] = "successfully"
        redirect_to owners_product_path(@product.id)
      else
        render :new
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
      params.require(:product).permit(:name, :introduce, :image, :price, :genre_id, :product_status, :delete_flag)
    end

end
