# .-. .-. .-. .-. .-. . . .-. .
# | | |(   |  |..  |  |\| |-| |
# `-' ' ' `-' `-' `-' ' ` ` ' `-'

# class CocktailsController < ApplicationController

#   def show
#     @cocktail = Cocktail.find(params[:id])
#     @ingredients = Ingredient.all
#   end

#   def index
#     @cocktails = Cocktail.all
#     @ingredients = Ingredient.all

#     # <p>TOP OF THE PAGE <%= @all_found_cocktails </p>

#     if params[:search_query] && current_user

#     #  CONVERT USER SEARCH INTO INGR INSTANCE
#       search_ingr = Ingredient.find_by(name: params[:search_query])

#     # CABINET LOGIC WITH USER SEARCH
#       idk = Cabinet.find_by(ingredient: search_ingr, user: current_user)

#       if idk && idk.in_stock == false
#         idk.in_stock = true
#         idk.save!
#       elsif idk == nil
#         Cabinet.create!(ingredient: search_ingr, user: current_user)
#       end
#     end

    #  SEARCH FUNCTION BELOW
    # found_cocktails_id = []
    # array = Measurement.where(ingredient: search_ingr)
    # array.each do |item|
    #   found_cocktail_id = item.cocktail_id
    #   found_cocktails_id << found_cocktail_id
    # end

    # @all_found_cocktails = []
    # found_cocktails_id.each do |id|
    #   cocktail = Cocktail.find_by(id:id)
    #   @all_found_cocktails << cocktail
    # end

#     @user_ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true).to_a
#   end
# end

# .-. .-. .-. .-. .-. . . .-. .
# | | |(   |  |..  |  |\| |-| |
# `-' ' ' `-' `-' `-' ' ` ` ' `-'




# class CocktailsController < ApplicationController

#   def show
#     @cocktail = Cocktail.find(params[:id])
#     @ingredients = Ingredient.all
#   end

#   def index
#     @cocktails = Cocktail.all
#     @ingredients = Ingredient.all

#     # <p>TOP OF THE PAGE <%= @all_found_cocktails </p>

#     if params[:search_query] && current_user

#       #  CONVERT USER SEARCH INTO INGR INSTANCE
#         search_ingr = []
#         search_ingr << Ingredient.find_by(name: params[:search_query])

#       # CABINET LOGIC WITH USER SEARCH
#         search_ingr.each do |ingredient|

#           idk = Cabinet.find_by(ingredient: ingredient, user: current_user)
#           if idk && idk.in_stock == false
#             idk.in_stock = true
#             idk.save!
#           elsif idk == nil
#             Cabinet.create!(ingredient: ingredient, user: current_user)
#           end
#         end
#     end

#     #  SEARCH FUNCTION BELOW
#     found_cocktails_id = []
#     array = []
#     unless search_ingr.nil?

#       search_ingr.each do |ingredient|
#         array << Measurement.where(ingredient: ingredient)
#       end

#       array.each do |item|
#         found_cocktail_id = item.find(item.cocktail_id)
#         found_cocktails_id << found_cocktail_id
#       end

#       @all_found_cocktails = []
#       found_cocktails_id.each do |id|
#         cocktail = Cocktail.find_by(id)
#         @all_found_cocktails << cocktail
#       end

#       cocktail_duplicates = []
#       ready_cocktails = []
#       one_cocktails = []
#       two_cocktails = []
#       cocktails.each do |cocktail|
#         cocktail_duplicates << @all_found_cocktails.where(cocktail)
#         case (cocktail_duplicates.count - Ingredient.where(cocktail).count).to_i
#         when 0
#           ready_cocktails << cocktail
#         when -1
#           one_cocktails << cocktail
#         when -2
#           two_cocktails << cocktail
#         end
#       end

#     @user_ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true).to_a
#   end
# end
# end




# class CocktailsController < ApplicationController

#   def show
#     @cocktail = Cocktail.find(params[:id])
#     @ingredients = Ingredient.all
#   end

#   def index
#     @cocktails = Cocktail.all
#     @ingredients = Ingredient.all
#     @user_ingredients_in_stock = Cabinet.where(user: current_user, in_stock: true).to_a

#     # <p>TOP OF THE PAGE <%= @all_found_cocktails </p>

#     if params[:search_query] && current_user

#       #  CONVERT USER SEARCH INTO INGR INSTANCE
#         search_ingr = []
#         search_ingr << Ingredient.find_by(name: params[:search_query])

#       # CABINET LOGIC WITH USER SEARCH
#         idk = Cabinet.find_by(ingredient: search_ingr, user: current_user)

#         if idk && idk.in_stock == false
#           idk.in_stock = true
#           idk.save!
#         elsif idk == nil
#           Cabinet.create!(ingredient: search_ingr, user: current_user)
#         end
#     end

#     #  SEARCH FUNCTION BELOW
#     found_cocktails_id = []
#     array = [Ingredient.last]
#     @user_ingredients_in_stock.each do |tag|
#       array << Measurement.where(ingredient: tag)
#     puts (array)
#     end
#     array.each do |item|
#       found_cocktail_id = item.cocktail_id
#       found_cocktails_id << found_cocktail_id
#     end

#     @all_found_cocktails = []
#     found_cocktails_id.each do |id|
#       cocktail = Cocktail.find_by(id)
#       @all_found_cocktails << cocktail
#     end

#     #comparing
#     @ready_cocktails = []
#     @one_cocktails = []
#     @two_cocktails = []
#     @cocktails.each do |cocktail|
#       cocktail_duplicates << @all_found_cocktails.where(cocktail)
#       case (cocktail_duplicates.count - Ingredient.where(cocktail).count).to_i
#       when 0
#         @ready_cocktails << cocktail
#       when -1
#         @one_cocktails << cocktail
#       when -2
#         @two_cocktails << cocktail
#       end
#     end



#   end
# end

# 1 - get input
  #  tag
# 2 - store tags
# 3 - iterate thru cocktail to find cocktails that contain tag
  # store each cocktail instance that contains each tag (meaning we have duplicates)
# 4 - iterate thru results and count recurrence of each cocktail
  # compare cocktail count to number of ingredients
    #cocktail_count - cocktail_ingredient_count = num
  # store cocktail in separate arrays if diff (num) "0 or 1 or 2"







# .-. .-. .-. .-. .-. . .
# `-. |-  |-| |(  |   |-|
# `-' `-' ` ' ' ' `-' ' `
class CocktailsController < ApplicationController

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = Ingredient.all
  end

  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all
    @measurements = Measurement.all
    @ingredients_my = Cabinet.where(user_id: current_user.id, in_stock: true)

    # @ingredients = Ingredient.where(id: @tags).pluck(:name)

    # 1 - get input
    if params[:search_query].present? && current_user
      #  1.1 -tag
      #  CONVERT USER SEARCH INTO INGR INSTANCE
      search_ingr = Ingredient.find_by(name: params[:search_query])

      # 2 - store tags
      # CABINET LOGIC WITH USER SEARCH
      @idk = Cabinet.find_by(ingredient: search_ingr, user: current_user)

      if @idk && @idk.in_stock == false
        @idk.in_stock = true
        @idk.save!
      elsif @idk == nil
        Cabinet.create!(ingredient: search_ingr, user: current_user)
      end
    end
    # 3 - iterate thru cocktail to find cocktails that contain tag
    # store each cocktail instance that contains each tag (meaning we have duplicates)
    @found_cocktails_id = []

    @ingredients_my.pluck(:ingredient_id).each do |ingredient|
      array = Measurement.where(ingredient_id: ingredient)
      array.each do |item|
        found_cocktail_id = item.cocktail_id
        @found_cocktails_id << found_cocktail_id
      end
    end

    @all_found_cocktails = Cocktail.where(id: @found_cocktails_id.uniq)

    @user_ingredients_in_stock = @ingredients_my
  end

    # 4 - iterate thru results and count recurrence of each cocktail
    # compare cocktail count to number of ingredients
    #cocktail_count - cocktail_ingredient_count = num
    # store cocktail in separate arrays i f diff (num) "0 or 1 or 2"
end
