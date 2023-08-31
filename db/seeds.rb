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
  "Gin Tonic",
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
  "Blue Hurricane",
  "Michelada",
  "Blue Lagoon",
  "Boulevardier"]

def cocktails_dataset
  api_key = ENV["API_KEY"]

  puts "Creating ingredients from API"
  ingredients = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
  ingredients_array = JSON.parse(ingredients)['drinks']

  ingredients_array.each do |i|
    i["strIngredient1"] = i["strIngredient1"].downcase
    Ingredient.create!(
      name: i['strIngredient1']
    )
  end

  puts "FINISHED creating #{Ingredient.count} ingredients."

require 'json'

# Read cocktail data from the JSON file
cocktail_data = JSON.parse(File.read('db/cocktail_data.json'))
cocktail_data.each do |c|
  Cocktail.create!(
    name: c['strDrink'],
    instructions: c['strInstructions'] || "Put everything in the glass",
    alcoholic: c['strAlcoholic'],
    glass: c['strGlass'],
    image: c['strDrinkThumb'],
    IBA: c['strIBA'],
    tags: c['strTags']
  )
end
puts "FINISHED creating #{Cocktail.count} cocktails"

ingredients_api = {}

puts "************ Creating measurements and ingredients *************"

cocktail_data.each do |c|
  ingredients = []
  measurements = []

  # Extract ingredients and measurements
  (1..15).each do |i|
    ingredient = c["strIngredient#{i}"]
    measure = c["strMeasure#{i}"]

    break if ingredient.nil? || ingredient.empty?

    ingredients << ingredient.downcase
    measurements << measure || "1 unit"
  end

  # Create unique ingredients in the database
  ingredients.each do |ing|
    Ingredient.find_or_create_by(name: ing)
  end

  # Find the cocktail in the database
  cocktail_found = Cocktail.find_by(name: c['strDrink'])

  # Create measurements for the cocktail
  ingredients.each_with_index do |ingr, index|
    ingredient = Ingredient.find_by(name: ingr)
    measure = measurements[index]

    if measure.include?("oz")
      quantity = measure.split(" ")[0].to_i
      unit = "oz"
    elsif measure.strip.include?(" ") && measure.match?(/\s/)
      quantity = measure.split(" ")[0].to_i
      unit = measure.split(" ")[-1]
    elsif !measure.strip.include?(" ") && measure.match?(/\s/)
      quantity = 1
      unit = measure
    elsif measure.strip.include?(" ") && !measure.match?(/\s/)
      quantity = measure
      unit = "unit"
    else
      quantity = 1
      unit = "unit"
    end

    Measurement.create!(
      cocktail: cocktail_found,
      ingredient: ingredient,
      quantity: quantity,
      unit: unit
    )
  end
end
end

puts "Added new ingredients from cocktails. Total ingredients = #{Ingredient.count}"
puts "FINISHED creating #{Measurement.count} measurements"
cocktails_dataset()

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

puts "Enjoy coding! 😊 🍸 🍹 🥂 🥃 "