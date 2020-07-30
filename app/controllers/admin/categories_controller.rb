class Admin::CategoriesController < ApplicationController
  def index
  	@categories = Category.all.page(params[:page])
    @category = Category.new
  end

  def create
  	@category = Category.new(name: params[:category][:name], status: params[:category][:status])
    if @category.save(category_params)
    	flash[:notice] = "successfully"
        redirect_to admin_categories_path
	else
        render :index
    end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
  	if @category.update(category_params)
      flash[:notice] = "successfully"
      redirect_to admin_categories_path
    else
      flash[:notice] = "error"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end


  private
  def category_params
      params.require(:category).permit(:name, :status)
  end
end
