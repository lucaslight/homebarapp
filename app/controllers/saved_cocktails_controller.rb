class SavedCocktailsController < ApplicationController
  def create
  end

  def index
    @saved_cocktails = SavedCocktail.all

    @user_ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true).to_a

    @saved_cocktails.each do |saved_cocktail|
      @saved_cocktail_ingredients = saved_cocktail.cocktail.ingredients
    end
  end

  def destroy #/delete
  end
end
