class SavedCocktailsController < ApplicationController
  def create
  end

  def index
    @saved_cocktails = SavedCocktail.where(user: current_user)

    @user_ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true).to_a
  
    @user_ingredients = []
    @user_ingredients_in_stock.each do |user_ingredient|
      @user_ingredients << user_ingredient.ingredient
    end

    second_array = []
    @saved_cocktails.each do |saved_cocktail|
      second_array << saved_cocktail.cocktail.ingredients
    end
    @saved_ingredients = second_array.flatten

    @grocery_list = []
    @saved_ingredients.each do |item|
      @grocery_list << item if !@user_ingredients.include?(item)
    end

    @grocery_list
  end

  def destroy #/delete
  end
end
