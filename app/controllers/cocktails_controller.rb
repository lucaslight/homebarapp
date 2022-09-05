class CocktailsController < ApplicationController

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end

  def index

    # .-. .-. .-. .-. .-. . .
    # `-. |-  |-| |(  |   |-|
    # `-' `-' ` ' ' ' `-' ' `
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all
    @measurements = Measurement.all
    @user_ingredients_in_stock = Cabinet.where(user_id: current_user.id, in_stock: true)
    @found_cocktails_id = []
    @ready = []
    @missing_one = []
    @missing_two = []
    @saved_cocktails = SavedCocktail.where(user: current_user)

    # 1 - get input
    create_ingredient_tags
    # 3 - Search based on (in stock) cabinet || @user_ingredients_in_stock
    search_based_on_ingredient_tags
    # 4 - Filter results to unique recurrence
    @all_found_cocktails = Cocktail.where(id: @found_cocktails_id.uniq)
    # 5 - Compare
    @all_found_cocktails.pluck(:id).each do |cocktailid| #=> [id, id, id]
      @result_cocktail_ingredients = Measurement.where(cocktail_id: cocktailid).pluck(:ingredient_id) #=> [id, id, id]
      @result_cabinet_ingredients = @user_ingredients_in_stock.pluck(:ingredient_id) #=> [id, id, id]
      @missing_ingredients = @result_cocktail_ingredients - @result_cabinet_ingredients
      case @missing_ingredients.count
      when 0
        @ready = Cocktail.where(id: cocktailid)
      when 1
        @missing_one = Cocktail.where(id: cocktailid)
      when 2
        @missing_two = Cocktail.where(id: cocktailid)
      end
    end

    # raise
  end


  def create_ingredient_tags
    if params[:search_query].present? && current_user
      search_ingr = Ingredient.find_by(name: params[:search_query])
      # 2 - save to cabinet || @user_ingredients_in_stock
      @idk = Cabinet.find_by(ingredient: search_ingr, user: current_user)
      if @idk && @idk.in_stock == false
        @idk.in_stock = true
        @idk.save!
      elsif @idk == nil
        Cabinet.create!(ingredient: search_ingr, user: current_user)
      end
    end
  end

  def search_based_on_ingredient_tags
    @user_ingredients_in_stock.pluck(:ingredient_id).each do |ingredient|
      array = Measurement.where(ingredient_id: ingredient)
      array.each do |item|
        found_cocktail_id = item.cocktail_id
        @found_cocktails_id << found_cocktail_id
      end
    end
  end

    # 4 - iterate thru results and count recurrence of each cocktail
    # compare cocktail count to number of ingredients
    #cocktail_count - cocktail_ingredient_count = num
    # store cocktail in separate arrays i f diff (num) "0 or 1 or 2"
end
