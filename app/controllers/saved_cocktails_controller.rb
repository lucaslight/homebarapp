class SavedCocktailsController < ApplicationController
  def create
  end

  def index
    @saved_cocktails = SavedCocktail.where(user: current_user)

    @user_ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true).to_a
    @ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true)
    @my_ing = @ingredients_in_stock.includes(:ingredient).pluck('ingredients.name')

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
      @grocery_list << item if !@user_ingredients.include?(item) && !@grocery_list.include?(item)
    end

    @grocery_list
  end

  def create_from_index
    new_user_cocktail = Cocktail.find(params[:id])
    if current_user
      SavedCocktail.create(user: current_user, cocktail_id: new_user_cocktail.id)
    end
    redirect_to cocktails_path
  end

  def new
  end

  def destroy
    SavedCocktail.find(params[:id]).destroy
    # if else statement for the redirection
    # redirect_to cocktails_path, status: :see_other
    redirect_back(fallback_location: root_path)
  end
end
