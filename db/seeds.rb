# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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

puts 'Initializing ingredients creation'

ingredients = Ingredient.create(
  [
    { name: 'sugar syrup' }, #0
    { name: 'vodka' }, #1
    { name: 'coffee liquor' }, #2
    { name: 'espresso' }, #3
    { name: 'cream' }, #4
    { name: 'lemon' }, #5
    { name: 'gin' }, #6
    { name: 'dry vermouth' }, #7
    { name: 'sweet red vermouth' }, #8
    { name: 'bitter campari' }, #9
    { name: 'scotch whisky' }, #10
    { name: 'orange' }, #11
    { name: 'lime' }, #12
    { name: 'ginger beer' }, #13
    { name: 'tonic water' }, #14
    { name: 'orange juice' }, #15
    { name: 'green olives' }, #16
    { name: 'bourbon whiskey' }, #17
    { name: 'lemon juice' }, #18
    { name: 'egg white / aquafaba' }, #19
    { name: 'lime juice' } #20
  ]
)

puts "Finished creating #{Ingredient.count} ingredients"

puts 'Initializing cocktails creation'

cocktails = Cocktail.create(
  [
    { #0
      name: 'espresso martini',
      instructions: 'Pour all ingredients into cocktail shaker, shake well with ice, strain into chilled cocktail glass.',
      alcoholic: true
    },
    { #1
      name: 'black russian',
      instructions: 'Pour the ingredients into the old fashioned glass filled with ice cubes. Stir gently.',
      alcoholic: true
    },
    { #2
      name: 'white russian',
      instructions: 'Pour the ingredients into the old fashioned glass filled with ice cubes. Float fresh cream on the top and stir in slowly.',
      alcoholic: true
    },
    { #3
      name: 'gin tonic',
      instructions: 'Fill a glass with ice cubes then pour gin and top off with tonic water. Garnish with lemon zest',
      alcoholic: true
    },
    { #4
      name: 'negroni',
      instructions: 'Pour all ingredients directly into a chilled old fashioned glass filled with ice, Stir gently. Garnish with a half orange slice.',
      alcoholic: true
    },
    { #5
      name: 'screw driver',
      instructions: 'Build all ingredients in a highball glass filled with ice.',
      alcoholic: true
    },
    { #6
      name: 'moscow mule',
      instructions: 'In a Mule Cup or rocks glass, combine the vodka and ginger beer. Add lime juice and gently stir to involve all ingredients. Garnish with lime slice.',
      alcoholic: true
    },
    { #7
      name: 'boulevardier',
      instructions: 'Pour all ingredients directly into a chilled old fashioned glass filled with ice, Stir gently. Garnish with a half orange slice.',
      alcoholic: true
    },
    { #8
      name: 'dry martini',
      instructions: 'Pour all ingredients into mixing glass with ice cubes. Stir well. Strain into chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with green olives if requested',
      alcoholic: true
    },
    { #9
      name: 'whisky sour',
      instructions: 'Pour all ingredients into a cocktail shaker filled with ice. Shake well. Strain into cobbler glass. If served "On the rocks", strain ingredients into an old fashioned glass filled with ice.
      If egg white is used shake little harder to release and incorporate the foam from the egg white. Garnish with a half orange slice and maraschino cherry, optionally use orange zest.',
      alcoholic: true
    },
  ]
)

puts "Finished creating #{Cocktail.count} cocktails"

puts 'Initializing measurements creation'

# downcase cocktails and ingredients
# re-hardcode the measurements

Measurement.create!(
  [
    {
      quantity: 10,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'espresso martini'),
      ingredient: Ingredient.find_by(name: 'sugar syrup')
    },
    {
      quantity: 50,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'espresso martini'),
      ingredient: Ingredient.find_by(name: 'vodka')
    },
    {
      quantity: 30,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'espresso martini'),
      ingredient: Ingredient.find_by(name: 'coffee liquor')
    },
    {
      quantity: 50,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'espresso martini'),
      ingredient: Ingredient.find_by(name: 'espresso')
    },
    {
      quantity: 50,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'black russian'),
      ingredient: Ingredient.find_by(name: 'vodka')
    },
    {
      quantity: 20,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'black russian'),
      ingredient: Ingredient.find_by(name: 'coffee liquor')
    },
    {
      quantity: 50,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'white russian'),
      ingredient: Ingredient.find_by(name: 'vodka')
    },
    {
      quantity: 20,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'white russian'),
      ingredient: Ingredient.find_by(name: 'coffee liquor')
    },
    {
      quantity: 20,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'white russian'),
      ingredient: Ingredient.find_by(name: 'cream')
    },
    {
      quantity: 1,
      unit: 'zest',
      cocktail: Cocktail.find_by(name: 'gin tonic'),
      ingredient: Ingredient.find_by(name: 'lemon')
    },
    {
      quantity: 50,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'gin tonic'),
      ingredient: Ingredient.find_by(name: 'gin')
    },
    {
      quantity: 120,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'gin tonic'),
      ingredient: Ingredient.find_by(name: 'tonic water')
    },
    {
      quantity: 30,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'negroni'),
      ingredient: Ingredient.find_by(name: 'gin')
    },
    {
      quantity: 30,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'negroni'),
      ingredient: Ingredient.find_by(name: 'bitter campari')
    },
    {
      quantity: 30,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'negroni'),
      ingredient: Ingredient.find_by(name: 'sweet red vermouth')
    },
    {
      quantity: 1,
      unit: 'slice',
      cocktail: Cocktail.find_by(name: 'screw driver'),
      ingredient: Ingredient.find_by(name: 'orange')
    },
    {
      quantity: 50,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'screw driver'),
      ingredient: Ingredient.find_by(name: 'vodka')
    },
    {
      quantity: 120,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'screw driver'),
      ingredient: Ingredient.find_by(name: 'orange juice')
    },
    {
      quantity: 45,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'moscow mule'),
      ingredient: Ingredient.find_by(name: 'vodka')
    },
    {
      quantity: 120,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'moscow mule'),
      ingredient: Ingredient.find_by(name: 'ginger beer')
    },
    {
      quantity: 10,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'moscow mule'),
      ingredient: Ingredient.find_by(name: 'lime juice')
    },
    {
      quantity: 1,
      unit: 'slice',
      cocktail: Cocktail.find_by(name: 'moscow mule'),
      ingredient: Ingredient.find_by(name: 'lime')
    },
    {
      quantity: 30,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'boulevardier'),
      ingredient: Ingredient.find_by(name: 'bourbon whiskey')
    },
    {
      quantity: 30,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'boulevardier'),
      ingredient: Ingredient.find_by(name: 'bitter campari')
    },
    {
      quantity: 30,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'boulevardier'),
      ingredient: Ingredient.find_by(name: 'sweet red vermouth')
    },
    {
      quantity: 1,
      unit: 'slice',
      cocktail: Cocktail.find_by(name: 'boulevardier'),
      ingredient: Ingredient.find_by(name: 'orange')
    },
    {
      quantity: 60,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'dry martini'),
      ingredient: Ingredient.find_by(name: 'gin')
    },
    {
      quantity: 10,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'dry martini'),
      ingredient: Ingredient.find_by(name: 'dry vermouth')
    },
    {
      quantity: 2,
      unit: 'units',
      cocktail: Cocktail.find_by(name: 'dry martini'),
      ingredient: Ingredient.find_by(name: 'green olives')
    },
    {
      quantity: 45,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'whisky sour'),
      ingredient: Ingredient.find_by(name: 'bourbon whiskey')
    },
    {
      quantity: 25,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'whisky sour'),
      ingredient: Ingredient.find_by(name: 'lemon juice')
    },
    {
      quantity: 20,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'whisky sour'),
      ingredient: Ingredient.find_by(name: 'vodka')
    },
    {
      quantity: 20,
      unit: 'ml',
      cocktail: Cocktail.find_by(name: 'whisky sour'),
      ingredient: Ingredient.find_by(name: 'egg white / aquafaba')
    }
  ]
)

puts "Finished creating #{Measurement.count} measurements"

puts 'Initializing cabinets creation'

Cabinet.create!(
  [
    # For Lucas
    {
      user_id: User.first.id,
      ingredient_id: ingredients[6].id,
      in_stock: true
    },

    {
      user_id: User.first.id,
      ingredient_id: ingredients[1].id,
      in_stock: true
    },

    {
      user_id: User.first.id,
      ingredient_id: ingredients[3].id,
      in_stock: false
    },
    # For Alvaro
    {
      user_id: User.last.id,
      ingredient_id: ingredients[6].id,
      in_stock: true
    },

    {
      user_id: User.last.id,
      ingredient_id: ingredients[1].id,
      in_stock: true
    },

    {
      user_id: User.last.id,
      ingredient_id: ingredients[3].id,
      in_stock: false
    }
  ]
)

puts "Finished creating #{Cabinet.count} cabinets"

puts 'Initializing saved cocktails creation'

SavedCocktail.create!(
  [
    # For Lucas
    {
      user_id: User.first.id,
      cocktail: Cocktail.find_by(name: 'black russian')
    },

    {
      user_id: User.first.id,
      cocktail: Cocktail.find_by(name: 'negroni')
    },
    # For Alvaro
    {
      user_id: User.last.id,
      cocktail: Cocktail.find_by(name: 'black russian')
    },

    {
      user_id: User.last.id,
      cocktail: Cocktail.find_by(name: 'negroni')
    }
  ]
)

puts "Finished creating #{SavedCocktail.count} saved cocktails"

puts "Enjoy coding! :)"
