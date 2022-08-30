class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end
end
