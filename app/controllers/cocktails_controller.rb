class CocktailsController < ApplicationController

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end

  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all
    @measurements = Measurement.all
    @user_ingredients_in_stock = Cabinet.where(user_id: current_user.id, in_stock: true)
    @saved_cocktails = SavedCocktail.where(user: current_user)
    @filtered_cocktails = []

    create_ingredient_tags if params[:search_query].present? && current_user
    search_based_on_ingredient_tags
    filter_results_to_unique_recurrence
    compare_ingredients
    filter_cocktails
  end

  private

  def create_ingredient_tags
    query = Ingredient.where(name: params[:search_query].downcase)
    if query.count >= 1
      search_ingr = query.first
    else
      search_ingr = Ingredient.where('name LIKE ?', "%#{params[:search_query].downcase}%").first
    end
    # 2 - save to cabinet || @user_ingredients_in_stock
    @idk = Cabinet.find_or_create_by(ingredient: search_ingr, user: current_user)
    @idk.update!(in_stock: true) if @idk.in_stock == false
  end

  def search_based_on_ingredient_tags
    @found_cocktails_id = []
    @user_ingredients_in_stock.pluck(:ingredient_id).each do |ingredient|
      array = Measurement.where(ingredient_id: ingredient)
      array.each do |item|
        found_cocktail_id = item.cocktail_id
        @found_cocktails_id << found_cocktail_id
      end
    end
  end

  def filter_results_to_unique_recurrence
    @all_found_cocktails = Cocktail.where(id: @found_cocktails_id)
  end

  def compare_ingredients
    @ready, @missing_one, @missing_two = [], [], []
    @all_found_cocktails.each do |cocktail|
      result_cocktail_ingredients = cocktail.ingredients.pluck(:id)
      result_cabinet_ingredients = @user_ingredients_in_stock.pluck(:ingredient_id)
      missing_ingredients = result_cocktail_ingredients - result_cabinet_ingredients
      case missing_ingredients.count
      when 0
        @ready << cocktail
      when 1
        @missing_one << cocktail
      when 2
        @missing_two << cocktail
      end
    end
  end

  def filter_cocktails
    @filtered_cocktails = [@ready, @missing_one, @missing_two].flatten
    @ready.flatten!
    @missing_one.flatten!
    @missing_two.flatten!
  end
end
