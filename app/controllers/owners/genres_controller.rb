class Owners::GenresController < ApplicationController
  def index
  	@genres = Genre.where(owner_id: current_owner.id).page(params[:page])
    @genre = Genre.new
  end

  def create
  	@genre = Genre.new(name: params[:genre][:name], status: params[:genre][:status])
  	@genre.owner_id = current_owner.id
    if @genre.save(genre_params)
    	flash[:notice] = "successfully"
        redirect_to owners_genres_path
	else
        render :index
    end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
      flash[:notice] = "successfully"
      redirect_to owners_genres_path
    else
      flash[:notice] = "error"
      render :edit
    end
  end
  
end

  private
  def genre_params
      params.require(:genre).permit(:name, :status)
  end