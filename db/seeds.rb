# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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


ingredients = Ingredient.create(
  [
    { name: 'Sugar Syrup' }, #0
    { name: 'Vodka' }, #1
    { name: 'Coffee Liquor' }, #2
    { name: 'Espresso' }, #3
    { name: 'Cream' }, #4
    { name: 'ingredient' }, #5
    { name: 'ingredient' }, #6
    { name: 'ingredient' }, #7
    { name: 'ingredient' }, #8
    { name: 'ingredient' }, #9
    { name: 'ingredient' }, #10
    { name: 'ingredient' }, #11
    { name: 'ingredient' }, #12
    { name: 'ingredient' }, #13
    { name: 'ingredient' }, #14
    { name: 'ingredient' }, #15
    { name: 'ingredient' }, #16
    { name: 'ingredient' }, #17
    { name: 'ingredient' }, #18
    { name: 'ingredient' }, #19
    { name: 'ingredient' } #20
  ]
)

cocktails = Cocktail.create(
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
    instructions: 'instructions',
    alcoholic: true
  },
  { #4
    name: 'Negroni',
    instructions: 'instructions',
    alcoholic: true
  },
  { #5
    name: 'Screw Driver',
    instructions: 'instructions',
    alcoholic: true
  },
  { #6
    name: 'Moscow Mule',
    instructions: 'instructions',
    alcoholic: true
  },
  { #7
    name: 'Boulevardier',
    instructions: 'instructions',
    alcoholic: true
  },
  { #8
    name: 'Dry Martini',
    instructions: 'instructions',
    alcoholic: true
  },
  { #9
    name: 'Whisky Sour',
    instructions: 'instructions',
    alcoholic: true
  },
)

Measurement.create(
  [
    {
      quantity: '10',
      unity: 'ml',
      cocktail_id: cocktails[0].id,
      ingredient_id: ingredients[0].id
    },
    {
      quantity: '50',
      unity: 'ml',
      cocktail_id: cocktails[0].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '30',
      unity: 'ml',
      cocktail_id: cocktails[0].id,
      ingredient_id: ingredients[2].id
    },
    {
      quantity: '50',
      unity: 'ml',
      cocktail_id: cocktails[0].id,
      ingredient_id: ingredients[3].id
    },
    {
      quantity: '50',
      unity: 'ml',
      ccocktail_id: cocktails[1].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '20',
      unity: 'ml',
      ccocktail_id: cocktails[1].id,
      ingredient_id: ingredients[2].id
    },
    {
      quantity: '50',
      unity: 'ml',
      ccocktail_id: cocktails[2].id,
      ingredient_id: ingredients[1].id
    },
    {
      quantity: '20',
      unity: 'ml',
      ccocktail_id: cocktails[2].id,
      ingredient_id: ingredients[2].id
    },
    {
      quantity: 'quantity',
      unity: 'unit',
      ccocktail_id: cocktails[].id,
      ingredient_id: ingredients[].id
    },
    {
      quantity: 'quantity',
      unity: 'unit',
      ccocktail_id: cocktails[].id,
      ingredient_id: ingredients[].id
    },
    {
      quantity: 'quantity',
      unity: 'unit',
      ccocktail_id: cocktails[].id,
      ingredient_id: ingredients[].id
    },
    {
      quantity: 'quantity',
      unity: 'unit',
      ccocktail_id: cocktails[].id,
      ingredient_id: ingredients[].id
    },
    {
      quantity: 'quantity',
      unity: 'unit',
      ccocktail_id: cocktails[].id,
      ingredient_id: ingredients[].id
    },
    {
      quantity: 'quantity',
      unity: 'unit',
      ccocktail_id: cocktails[].id,
      ingredient_id: ingredients[].id
    }
  ]
)
