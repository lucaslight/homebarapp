class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all
    @user_ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true).to_a
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end
end
