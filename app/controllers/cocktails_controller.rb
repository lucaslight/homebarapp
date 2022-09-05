class CocktailsController < ApplicationController

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end

  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all

    # <p>TOP OF THE PAGE <%= @all_found_cocktails </p>
    if params[:search_query] && current_user

      #  CONVERT USER SEARCH INTO INGR INSTANCE
      # search_ingr = Ingredient.find_by(name: params[:search_query].downcase)
      search_ingr = Ingredient.where('name LIKE ?', "%#{params[:search_query]}%")

      # CABINET LOGIC WITH USER SEARCH
      idk = Cabinet.find_by(ingredient: search_ingr, user: current_user)

      if idk && idk.in_stock == false
        idk.in_stock = true
        idk.save!
      elsif idk.nil?
        Cabinet.create!(ingredient: search_ingr, user: current_user)
      end
    end

    #  SEARCH FUNCTION BELOW
    found_cocktails_id = []
    array = Measurement.where(ingredient: search_ingr)
    array.each do |item|
      found_cocktail_id = item.cocktail_id
      found_cocktails_id << found_cocktail_id
    end

    @all_found_cocktails = []
    found_cocktails_id.each do |id|
      cocktail = Cocktail.find_by(id:id)
      @all_found_cocktails << cocktail
    end

    @user_ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true).to_a
  end
end
