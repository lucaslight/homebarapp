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
    @filtered_cocktails = []

    # 1 - get input
    create_ingredient_tags
    # 3 - Search based on (in stock) cabinet || @user_ingredients_in_stock
    search_based_on_ingredient_tags
    # 4 - Filter results to unique recurrence
    @all_found_cocktails = Cocktail.where(id: @found_cocktails_id.uniq)
    # 5 - Compare
    compare_ingredients
    # 6 - Filter cocktails (ready, -1, -2)
    @filtered_cocktails = @ready, @missing_one, @missing_two
    @filtered_cocktails.flatten!
    @ready.flatten!
    @missing_one.flatten!
    @missing_two.flatten!
    # raise
  end

  def create_ingredient_tags
    if params[:search_query].present? && current_user
      query = Ingredient.where(name: params[:search_query].downcase)
      if query.count >= 1
        search_ingr = query.first
      else
        search_ingr = Ingredient.where('name LIKE ?', "%#{params[:search_query].downcase}%").first
      end

      # 2 - save to cabinet || @user_ingredients_in_stock
      @idk = Cabinet.find_by(ingredient: search_ingr, user: current_user)
      if @idk && @idk.in_stock == false
        @idk.in_stock = true
        @idk.save!
      elsif @idk == nil && search_ingr != nil
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

  def compare_ingredients
    @all_found_cocktails.pluck(:id).each do |cocktailid| #=> [id, id, id]
      @result_cocktail_ingredients = Measurement.where(cocktail_id: cocktailid).pluck(:ingredient_id) #=> [id, id, id]
      @result_cabinet_ingredients = @user_ingredients_in_stock.pluck(:ingredient_id) #=> [id, id, id]
      @missing_ingredients = @result_cocktail_ingredients - @result_cabinet_ingredients
      case @missing_ingredients.count
      when 0
        @ready << Cocktail.where(id: cocktailid)
      when 1
        @missing_one << Cocktail.where(id: cocktailid)
      when 2
        @missing_two << Cocktail.where(id: cocktailid)
      end
    end
  end
end
