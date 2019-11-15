class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  # def edit
  #   @cocktail = Cocktail.find(params[:id])
  #   @cocktail = Cocktail.new(cocktails_params)
  #   @cocktail.save
  #   redirect_to
  # end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end
  # def update

  # end

  # private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end