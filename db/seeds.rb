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
puts "Database is clean."

puts 'Creating users...'

User.create(
  [
    {
      first_name: 'Lucas',
      last_name: 'Luz',
      email: 'lucas@homebar.eu',
      encrypted_password: 'batch929',
      age: '32'
    },
    {
      first_name: 'Adrienne',
      last_name: 'Robert',
      email: 'adrienne@homebar.eu',
      encrypted_password: 'batch929',
      age: '26'
    },
    {
      first_name: 'Onofre',
      last_name: 'Catala',
      email: 'ono@homebar.eu',
      encrypted_password: 'batch929',
      age: '44'
    },
    {
      first_name: 'Alvaro',
      last_name: 'Trujillo',
      email: 'alvaro@homebar.eu',
      encrypted_password: 'batch929',
      age: '27'
    }
  ]
)

puts "Finished creating #{User.count} users"

puts 'Initializing ingredients creation'

ingredients = Ingredient.create(
  [
    { name: 'Sugar Syrup' }, #0
    { name: 'Vodka' }, #1
    { name: 'Coffee Liquor' }, #2
    { name: 'Espresso' }, #3
    { name: 'Cream' }, #4
    { name: 'Lemon' }, #5
    { name: 'Gin' }, #6
    { name: 'Dry Vermouth' }, #7
    { name: 'Sweet Red Vermouth' }, #8
    { name: 'Bitter Campari' }, #9
    { name: 'Scotch Whisky' }, #10
    { name: 'Orange' }, #11
    { name: 'Lime' }, #12
    { name: 'Ginger Beer' }, #13
    { name: 'Tonic Water' }, #14
    { name: 'Orange Juice' }, #15
    { name: 'Green Olives' }, #16
    { name: 'Bourbon Whiskey' }, #17
    { name: 'Lemon Juice' }, #18
    { name: 'Egg white / Aquafaba' }, #19
    { name: 'Lime Juice' } #20
  ]
)

puts "Finished creating #{Ingredient.count} ingredients"

puts 'Initializing cocktails creation'

cocktails = Cocktail.create(
  [
    { #0
      name: 'Espresso Martini',
      instructions: 'Pour all ingredients into cocktail shaker, shake well with ice, strain into chilled cocktail glass.',
      alcoholic: true
    },
    { #1
      name: 'Black Russian',
      instructions: 'Pour the ingredients into the old fashioned glass filled with ice cubes. Stir gently.',
      alcoholic: true
    },
    { #2
      name: 'White Russian',
      instructions: 'Pour the ingredients into the old fashioned glass filled with ice cubes. Float fresh cream on the top and stir in slowly.',
      alcoholic: true
    },
    { #3
      name: 'Gin Tonic',
      instructions: 'Fill a glass with ice cubes then pour gin and top off with tonic water. Garnish with lemon zest',
      alcoholic: true
    },
    { #4
      name: 'Negroni',
      instructions: 'Pour all ingredients directly into a chilled old fashioned glass filled with ice, Stir gently. Garnish with a half orange slice.',
      alcoholic: true
    },
    { #5
      name: 'Screw Driver',
      instructions: 'Build all ingredients in a highball glass filled with ice.',
      alcoholic: true
    },
    { #6
      name: 'Moscow Mule',
      instructions: 'In a Mule Cup or rocks glass, combine the vodka and ginger beer. Add lime juice and gently stir to involve all ingredients. Garnish with lime slice.',
      alcoholic: true
    },
    { #7
      name: 'Boulevardier',
      instructions: 'Pour all ingredients directly into a chilled old fashioned glass filled with ice, Stir gently. Garnish with a half orange slice.',
      alcoholic: true
    },
    { #8
      name: 'Dry Martini',
      instructions: 'Pour all ingredients into mixing glass with ice cubes. Stir well. Strain into chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with green olives if requested',
      alcoholic: true
    },
    { #9
      name: 'Whisky Sour',
      instructions: 'Pour all ingredients into a cocktail shaker filled with ice. Shake well. Strain into cobbler glass. If served "On the rocks", strain ingredients into an old fashioned glass filled with ice.
      If egg white is used shake little harder to release and incorporate the foam from the egg white. Garnish with a half orange slice and maraschino cherry, optionally use orange zest.',
      alcoholic: true
    },
  ]
)

puts "Finished creating #{Cocktail.count} cocktails"

puts 'Initializing measurements creation'

Measurement.create(
  [
    {
      quantity: '10',
      unit: 'ml',
      cocktail_id: cocktails[0].id,
      ingredient_id: ingredients[0].id
    },
    {
      quantity: '50',
      unit: 'ml',
      cocktail_id: cocktails[0].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '30',
      unit: 'ml',
      cocktail_id: cocktails[0].id,
      ingredient_id: ingredients[2].id
    },
    {
      quantity: '50',
      unit: 'ml',
      cocktail_id: cocktails[0].id,
      ingredient_id: ingredients[3].id
    },
    {
      quantity: '50',
      unit: 'ml',
      cocktail_id: cocktails[1].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '20',
      unit: 'ml',
      cocktail_id: cocktails[1].id,
      ingredient_id: ingredients[2].id
    },
    {
      quantity: '50',
      unit: 'ml',
      cocktail_id: cocktails[2].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '20',
      unit: 'ml',
      cocktail_id: cocktails[2].id,
      ingredient_id: ingredients[2].id
    },
    {
      quantity: '20',
      unit: 'ml',
      cocktail_id: cocktails[2].id,
      ingredient_id: ingredients[4].id
    },
    {
      quantity: '1',
      unit: 'zest',
      cocktail_id: cocktails[3].id,
      ingredient_id: ingredients[5].id
    },
    {
      quantity: '50',
      unit: 'ml',
      cocktail_id: cocktails[3].id,
      ingredient_id: ingredients[6].id
    },
    {
      quantity: '120',
      unit: 'ml',
      cocktail_id: cocktails[3].id,
      ingredient_id: ingredients[14].id
    },
    {
      quantity: '30',
      unit: 'ml',
      cocktail_id: cocktails[4].id,
      ingredient_id: ingredients[6].id
    },
    {
      quantity: '30',
      unit: 'ml',
      cocktail_id: cocktails[4].id,
      ingredient_id: ingredients[9].id
    },
    {
      quantity: '30',
      unit: 'ml',
      cocktail_id: cocktails[4].id,
      ingredient_id: ingredients[8].id
    },
    {
      quantity: '30',
      unit: 'ml',
      cocktail_id: cocktails[7].id,
      ingredient_id: ingredients[17].id
    },
    {
      quantity: '30',
      unit: 'ml',
      cocktail_id: cocktails[7].id,
      ingredient_id: ingredients[9].id
    },
    {
      quantity: '30',
      unit: 'ml',
      cocktail_id: cocktails[7].id,
      ingredient_id: ingredients[8].id
    },
    {
      quantity: '1/2',
      unit: 'slice',
      cocktail_id: cocktails[7].id,
      ingredient_id: ingredients[11].id
    },
    {
      quantity: '1/2',
      unit: 'slice',
      cocktail_id: cocktails[5].id,
      ingredient_id: ingredients[11].id
    },
    {
      quantity: '50',
      unit: 'ml',
      cocktail_id: cocktails[5].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '120',
      unit: 'ml',
      cocktail_id: cocktails[5].id,
      ingredient_id: ingredients[15].id
    },
    {
      quantity: '45',
      unit: 'ml',
      cocktail_id: cocktails[6].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '120',
      unit: 'ml',
      cocktail_id: cocktails[6].id,
      ingredient_id: ingredients[13].id
    },
    {
      quantity: '10',
      unit: 'ml',
      cocktail_id: cocktails[6].id,
      ingredient_id: ingredients[20].id
    },
    {
      quantity: '1',
      unit: 'slice',
      cocktail_id: cocktails[6].id,
      ingredient_id: ingredients[12].id
    },
    {
      quantity: '60',
      unit: 'ml',
      cocktail_id: cocktails[8].id,
      ingredient_id: ingredients[6].id
    },
    {
      quantity: '10',
      unit: 'ml',
      cocktail_id: cocktails[8].id,
      ingredient_id: ingredients[7].id
    },
    {
      quantity: '2',
      unit: 'units',
      cocktail_id: cocktails[8].id,
      ingredient_id: ingredients[16].id
    },
    {
      quantity: '45',
      unit: 'ml',
      cocktail_id: cocktails[9].id,
      ingredient_id: ingredients[17].id
    },
    {
      quantity: '25',
      unit: 'ml',
      cocktail_id: cocktails[9].id,
      ingredient_id: ingredients[18].id
    },
    {
      quantity: '20',
      unit: 'ml',
      cocktail_id: cocktails[9].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '20',
      unit: 'ml',
      cocktail_id: cocktails[9].id,
      ingredient_id: ingredients[19].id
    }
  ]
)

puts "Finished creating #{Measurement.count} measurements"

puts "Enjoy coding! :)"
