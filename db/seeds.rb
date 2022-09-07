require 'rest-client'

puts "Cleaning database..."
puts "... measurements"
Measurement.destroy_all
puts "... cocktails"
Cocktail.destroy_all
puts "... users"
User.destroy_all
puts "... cabinets"
Cabinet.destroy_all
puts "... ingredients"
Ingredient.destroy_all
puts "... saved cocktails"
SavedCocktail.destroy_all
puts "Database is clean."


@all_iba_cocktails = ["Alexander",
  "Americano",
  "Angel Face",
  "Aviation",
  "Bacardi",
  "Between The Sheets",
  "Casino",
  "Clover Club",
  "Daiquiri",
  "Derby",
  "Dry Martini",
  "Gin Fizz",
  "John Collins",
  "Manhattan",
  "Mary Pickford",
  "Monkey Gland",
  "Negroni",
  "Old Fashioned",
  "Paradise",
  "Planters Punch",
  "Porto Flip",
  "Ramos Gin Fizz",
  "Rusty Nail",
  "Sazerac",
  "Screwdriver",
  "Sidecar",
  "Stinger",
  "Tuxedo",
  "Whiskey Sour",
  "White Lady",
  "Bellini",
  "Black Russian",
  "Bloody Mary",
  "Caipirinha",
  "Champagne Cocktail",
  "Cosmopolitan",
  "Cuba Libre",
  "French 75",
  "French Connection",
  "Godfather",
  "Godmother",
  "Golden Dream",
  "Grasshopper",
  "Harvey Wallbanger",
  "Hemingway Special",
  "Horse's Neck",
  "Irish Coffee",
  "Kir",
  "Long Island Iced Tea",
  "Mai Tai",
  "Margarita",
  "Mimosa",
  "Mint Julep",
  "Mojito",
  "Moscow Mule",
  "Pina Colada",
  "Rose",
  "Sea Breeze",
  "Sex On The Beach",
  "Singapore Sling",
  "Tequila Sunrise",
  "B-52",
  "Barracuda",
  "Bramble",
  "Dirty Martini",
  "Dark and Stormy",
  "Espresso Martini",
  "French Martini",
  "Kamikaze",
  "Lemon Drop",
  "Pisco Sour",
  "Russian Spring Punch",
  "Spritz Veneziano",
  "Tommy's Margarita",
  "Vampiro",
  "Vesper",
  "Yellow Bird",
  "Boulevardier"]

def cocktails_dataset
  api_key = ENV["API_KEY"]

  puts "Creating ingredients from API"
  ingredients = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
  ingredients_array = JSON.parse(ingredients)['drinks']

  ingredients_array.each do |i|
    Ingredient.create!(
      name: i['strIngredient1']
    )
  end

  puts "FINISHED creating #{Ingredient.count} ingredients."

  puts "Creating cocktails from API"


  cocktails_array = []

  @all_iba_cocktails.each do |i|
    cocktails = RestClient.get("www.thecocktaildb.com/api/json/v2/#{api_key}/search.php?s=#{i}")
    # .split("}")[0]
    cocktails_array << JSON.parse(cocktails)["drinks"]
  end


  cocktails_array = cocktails_array.flatten




  cocktails_array.each do |c|
    var = Cocktail.create!(
      name: c['strDrink'],
      instructions: c['strInstructions'] || "Put everything in the glass",
      alcoholic: c['strAlcoholic'] || true,
      glass: c['strGlass'],
      image: c['strDrinkThumb'],
      IBA: c['strIBA'],
      tags: c['strTags']
    )
    # puts var.name
  end

  puts "FINISHED creating #{Cocktail.count} cocktails"

  ingredients_api = {}
  measurements_api = {}

  puts "************ Creating measurements and ingredients *************"

  cocktails_array.each do |c|

    # Get all ingredients of that cocktail
    ingredient1 = c['strIngredient1']
    ingredient2 = c['strIngredient2']
    ingredient3 = c['strIngredient3']
    ingredient4 = c['strIngredient4']
    ingredient5 = c['strIngredient5']
    ingredient6 = c['strIngredient6']
    ingredient7 = c['strIngredient7']
    ingredient8 = c['strIngredient8']
    ingredient9 = c['strIngredient9']
    ingredient10 = c['strIngredient10']
    ingredient11 = c['strIngredient11']
    ingredient12 = c['strIngredient12']
    ingredient13 = c['strIngredient13']
    ingredient14 = c['strIngredient14']
    ingredient15 = c['strIngredient15']

    ingredients_api[c['strDrink']] = [ingredient1, ingredient2, ingredient3, ingredient4,
      ingredient5, ingredient6, ingredient7, ingredient8, ingredient9, ingredient10, ingredient11,
      ingredient12, ingredient13, ingredient14, ingredient15].reject { |ing| ing == nil }

    # Clean up ingredients of that cocktail (capitalize, flatten array)
    ingredients_api[c['strDrink']] = ingredients_api[c['strDrink']].map(&:titleize)

    uniq_ingredients_api = ingredients_api.values.flatten

    # if new ingredient, create DB Ingredient instance
    uniq_ingredients_api.each do |ing|
      if Ingredient.where(name: ing).empty?
        Ingredient.create!(name: ing)
      end
    end

    # start on measurements of that cocktail
    # get all measurements of that cocktail
    measure1 = c['strMeasure1']
    measure2 = c['strMeasure2']
    measure3 = c['strMeasure3']
    measure4 = c['strMeasure4']
    measure5 = c['strMeasure5']
    measure6 = c['strMeasure6']
    measure7 = c['strMeasure7']
    measure8 = c['strMeasure8']
    measure9 = c['strMeasure9']
    measure10 = c['strMeasure10']
    measure11 = c['strMeasure11']
    measure12 = c['strMeasure12']
    measure13 = c['strMeasure13']
    measure14 = c['strMeasure14']
    measure15 = c['strMeasure15']

    # put all measurements in one variable
    # measurements_api[c['strDrink']]
    measurements_of_c = [
      measure1, measure2, measure3, measure4, measure5, measure6, measure7,
      measure8, measure9, measure10, measure11, measure12, measure13,
      measure14, measure15
    ].reject { |m| m == nil || m == ""}

    # Clean up measurements of that cocktail

    # 1/ IF ingr has NO measurement, add default values 1 unit
    # by iterating through ingr and seeing if has relevant measurement

    ingredients_api[c['strDrink']].each_with_index do |ingr, index|
      # if !measurements_of_c[index].nil?
      #   measurement[ingr] = measurements_of_c[index]
      # else
      #   measurement[ingr] = "1 unit"
      # end
      if measurements_of_c[index].nil?
        measurements_of_c[index] = "1 unit"
      end
    end

    # 2/ IF measurements is only a string/ only number


    measurements_of_c.each_with_index do |measure, index|
      cocktail_found = Cocktail.find_by(name: c['strDrink'])
      ingredient = Ingredient.find_by(name: ingredients_api[c['strDrink']][index]) # not using  uniq_ingredients_api ??

      if measure.strip.include?(" ") && measure.match?(/\s/)
        quantity = measure.split(" ")[0].to_i
        unit = measure.split(" ")[-1]
      elsif !measure.strip.include?(" ") && measure.match?(/\s/)
        quantity = 1
        unit = measure
      elsif !measure.strip.include?(" ") && !measure.match?(/\s/)
        quantity = measure
        unit = "unit"
      end

      Measurement.create!(
        cocktail: cocktail_found,
        ingredient: ingredient,
        quantity: quantity,
        unit: unit
      )

      # puts "ISSUE WHEERE FUCK***********************************"
      # p c['strDrink']
      # p measurements_of_c

    end



    # if uniq_ingredients_api.count != measurements_api[c['strDrink']].count
    #   measurements_api[c['strDrink']] << "1 unit"
    # end

    #  MEASUREMENTS







  end
  puts "Added new ingredients from cocktails. Total ingredients= #{Ingredient.count}"
  puts "FINISHED creating #{Measurement.count} measurements"
end

cocktails_dataset()


# End of API seeding

puts 'Creating users...'

User.create!(
  [
    {
      first_name: 'Lucas',
      last_name: 'Luz',
      email: 'lucas@homebarapp.eu',
      password: 'batch929',
      birth_date: Date.new(1989, 12, 18)
    },
    {
      first_name: 'Adrienne',
      last_name: 'Robert',
      email: 'adrienne@homebarapp.eu',
      password: 'batch929',
      birth_date: Date.new(1996, 8, 29)
    },
    {
      first_name: 'Onofre',
      last_name: 'Catala',
      email: 'ono@homebarapp.eu',
      password: 'batch929',
      birth_date: Date.new(1978, 7, 29)
    },
    {
      first_name: 'Alvaro',
      last_name: 'Trujillo',
      email: 'alvaro@homebarapp.eu',
      password: 'batch929',
      birth_date: Date.new(1995, 1, 13)
    }
  ]
)

puts "Finished creating #{User.count} users"


# puts 'Initializing ingredients creation'

# ingredients = Ingredient.create(
#   [
#     { name: 'sugar syrup' }, #0
#     { name: 'vodka' }, #1
#     { name: 'coffee liquor' }, #2
#     { name: 'espresso' }, #3
#     { name: 'cream' }, #4
#     { name: 'lemon' }, #5
#     { name: 'gin' }, #6
#     { name: 'dry vermouth' }, #7
#     { name: 'sweet red vermouth' }, #8
#     { name: 'bitter campari' }, #9
#     { name: 'scotch whisky' }, #10
#     { name: 'orange' }, #11
#     { name: 'lime' }, #12
#     { name: 'ginger beer' }, #13
#     { name: 'tonic water' }, #14
#     { name: 'orange juice' }, #15
#     { name: 'green olives' }, #16
#     { name: 'bourbon whiskey' }, #17
#     { name: 'lemon juice' }, #18
#     { name: 'egg white / aquafaba' }, #19
#     { name: 'lime juice' } #20
#   ]
# )

# puts "Finished creating #{Ingredient.count} ingredients"

# puts 'Initializing cocktails creation'

# cocktails = Cocktail.create(
#   [
#     { #0
#       name: 'espresso martini',
#       instructions: 'Pour all ingredients into cocktail shaker, shake well with ice, strain into chilled cocktail glass.',
#       alcoholic: true
#     },
#     { #1
#       name: 'black russian',
#       instructions: 'Pour the ingredients into the old fashioned glass filled with ice cubes. Stir gently.',
#       alcoholic: true
#     },
#     { #2
#       name: 'white russian',
#       instructions: 'Pour the ingredients into the old fashioned glass filled with ice cubes. Float fresh cream on the top and stir in slowly.',
#       alcoholic: true
#     },
#     { #3
#       name: 'gin tonic',
#       instructions: 'Fill a glass with ice cubes then pour gin and top off with tonic water. Garnish with lemon zest',
#       alcoholic: true
#     },
#     { #4
#       name: 'negroni',
#       instructions: 'Pour all ingredients directly into a chilled old fashioned glass filled with ice, Stir gently. Garnish with a half orange slice.',
#       alcoholic: true
#     },
#     { #5
#       name: 'screw driver',
#       instructions: 'Build all ingredients in a highball glass filled with ice.',
#       alcoholic: true
#     },
#     { #6
#       name: 'moscow mule',
#       instructions: 'In a Mule Cup or rocks glass, combine the vodka and ginger beer. Add lime juice and gently stir to involve all ingredients. Garnish with lime slice.',
#       alcoholic: true
#     },
#     { #7
#       name: 'boulevardier',
#       instructions: 'Pour all ingredients directly into a chilled old fashioned glass filled with ice, Stir gently. Garnish with a half orange slice.',
#       alcoholic: true
#     },
#     { #8
#       name: 'dry martini',
#       instructions: 'Pour all ingredients into mixing glass with ice cubes. Stir well. Strain into chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with green olives if requested',
#       alcoholic: true
#     },
#     { #9
#       name: 'whisky sour',
#       instructions: 'Pour all ingredients into a cocktail shaker filled with ice. Shake well. Strain into cobbler glass. If served "On the rocks", strain ingredients into an old fashioned glass filled with ice.
#       If egg white is used shake little harder to release and incorporate the foam from the egg white. Garnish with a half orange slice and maraschino cherry, optionally use orange zest.',
#       alcoholic: true
#     },
#   ]
# )

# puts "Finished creating #{Cocktail.count} cocktails"

# puts 'Initializing measurements creation'

# # downcase cocktails and ingredients
# # re-hardcode the measurements

# Measurement.create!(
#   [
#     {
#       quantity: 10,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'espresso martini'),
#       ingredient: Ingredient.find_by(name: 'sugar syrup')
#     },
#     {
#       quantity: 50,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'espresso martini'),
#       ingredient: Ingredient.find_by(name: 'vodka')
#     },
#     {
#       quantity: 30,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'espresso martini'),
#       ingredient: Ingredient.find_by(name: 'coffee liquor')
#     },
#     {
#       quantity: 50,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'espresso martini'),
#       ingredient: Ingredient.find_by(name: 'espresso')
#     },
#     {
#       quantity: 50,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'black russian'),
#       ingredient: Ingredient.find_by(name: 'vodka')
#     },
#     {
#       quantity: 20,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'black russian'),
#       ingredient: Ingredient.find_by(name: 'coffee liquor')
#     },
#     {
#       quantity: 50,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'white russian'),
#       ingredient: Ingredient.find_by(name: 'vodka')
#     },
#     {
#       quantity: 20,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'white russian'),
#       ingredient: Ingredient.find_by(name: 'coffee liquor')
#     },
#     {
#       quantity: 20,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'white russian'),
#       ingredient: Ingredient.find_by(name: 'cream')
#     },
#     {
#       quantity: 1,
#       unit: 'zest',
#       cocktail: Cocktail.find_by(name: 'gin tonic'),
#       ingredient: Ingredient.find_by(name: 'lemon')
#     },
#     {
#       quantity: 50,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'gin tonic'),
#       ingredient: Ingredient.find_by(name: 'gin')
#     },
#     {
#       quantity: 120,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'gin tonic'),
#       ingredient: Ingredient.find_by(name: 'tonic water')
#     },
#     {
#       quantity: 30,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'negroni'),
#       ingredient: Ingredient.find_by(name: 'gin')
#     },
#     {
#       quantity: 30,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'negroni'),
#       ingredient: Ingredient.find_by(name: 'bitter campari')
#     },
#     {
#       quantity: 30,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'negroni'),
#       ingredient: Ingredient.find_by(name: 'sweet red vermouth')
#     },
#     {
#       quantity: 1,
#       unit: 'slice',
#       cocktail: Cocktail.find_by(name: 'screw driver'),
#       ingredient: Ingredient.find_by(name: 'orange')
#     },
#     {
#       quantity: 50,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'screw driver'),
#       ingredient: Ingredient.find_by(name: 'vodka')
#     },
#     {
#       quantity: 120,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'screw driver'),
#       ingredient: Ingredient.find_by(name: 'orange juice')
#     },
#     {
#       quantity: 45,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'moscow mule'),
#       ingredient: Ingredient.find_by(name: 'vodka')
#     },
#     {
#       quantity: 120,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'moscow mule'),
#       ingredient: Ingredient.find_by(name: 'ginger beer')
#     },
#     {
#       quantity: 10,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'moscow mule'),
#       ingredient: Ingredient.find_by(name: 'lime juice')
#     },
#     {
#       quantity: 1,
#       unit: 'slice',
#       cocktail: Cocktail.find_by(name: 'moscow mule'),
#       ingredient: Ingredient.find_by(name: 'lime')
#     },
#     {
#       quantity: 30,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'boulevardier'),
#       ingredient: Ingredient.find_by(name: 'bourbon whiskey')
#     },
#     {
#       quantity: 30,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'boulevardier'),
#       ingredient: Ingredient.find_by(name: 'bitter campari')
#     },
#     {
#       quantity: 30,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'boulevardier'),
#       ingredient: Ingredient.find_by(name: 'sweet red vermouth')
#     },
#     {
#       quantity: 1,
#       unit: 'slice',
#       cocktail: Cocktail.find_by(name: 'boulevardier'),
#       ingredient: Ingredient.find_by(name: 'orange')
#     },
#     {
#       quantity: 60,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'dry martini'),
#       ingredient: Ingredient.find_by(name: 'gin')
#     },
#     {
#       quantity: 10,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'dry martini'),
#       ingredient: Ingredient.find_by(name: 'dry vermouth')
#     },
#     {
#       quantity: 2,
#       unit: 'units',
#       cocktail: Cocktail.find_by(name: 'dry martini'),
#       ingredient: Ingredient.find_by(name: 'green olives')
#     },
#     {
#       quantity: 45,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'whisky sour'),
#       ingredient: Ingredient.find_by(name: 'bourbon whiskey')
#     },
#     {
#       quantity: 25,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'whisky sour'),
#       ingredient: Ingredient.find_by(name: 'lemon juice')
#     },
#     {
#       quantity: 20,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'whisky sour'),
#       ingredient: Ingredient.find_by(name: 'vodka')
#     },
#     {
#       quantity: 20,
#       unit: 'ml',
#       cocktail: Cocktail.find_by(name: 'whisky sour'),
#       ingredient: Ingredient.find_by(name: 'egg white / aquafaba')
#     }
#   ]
# )

# puts "Finished creating #{Measurement.count} measurements"

# puts 'Initializing cabinets creation'

# Cabinet.create!(
#   [
#     # For Lucas
#     {
#       user_id: User.first.id,
#       ingredient_id: ingredients[6].id,
#       in_stock: true
#     },

#     {
#       user_id: User.first.id,
#       ingredient_id: ingredients[1].id,
#       in_stock: true
#     },

#     {
#       user_id: User.first.id,
#       ingredient_id: ingredients[3].id,
#       in_stock: false
#     },
#     # For Alvaro
#     {
#       user_id: User.last.id,
#       ingredient_id: ingredients[6].id,
#       in_stock: true
#     },

#     {
#       user_id: User.last.id,
#       ingredient_id: ingredients[1].id,
#       in_stock: true
#     },

#     {
#       user_id: User.last.id,
#       ingredient_id: ingredients[3].id,
#       in_stock: false
#     }
#   ]
# )

# puts "Finished creating #{Cabinet.count} cabinets"

# puts 'Initializing saved cocktails creation'

# SavedCocktail.create!(
#   [
#     # For Lucas
#     {
#       user_id: User.first.id,
#       cocktail: Cocktail.find_by(name: 'black russian')
#     },

#     {
#       user_id: User.first.id,
#       cocktail: Cocktail.find_by(name: 'negroni')
#     },

#     {
#       user_id: User.first.id,
#       cocktail: Cocktail.find_by(name: 'white russian')
#     },

#     # For Alvaro
#     {
#       user_id: User.last.id,
#       cocktail: Cocktail.find_by(name: 'black russian')
#     },

#     {
#       user_id: User.last.id,
#       cocktail: Cocktail.find_by(name: 'negroni')
#     },

#     {
#       user_id: User.last.id,
#       cocktail: Cocktail.find_by(name: 'white russian')
#     }
#   ]
# )

# puts "Finished creating #{SavedCocktail.count} saved cocktails"

puts "Enjoy coding! 😊 🍸 🍹 🥂 🥃"
