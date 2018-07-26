require_relative '../config/environment.rb'

stew = Recipe.new("Stew")
spaghetti = Recipe.new("Spaghetti")
snack = Recipe.new("Snack")

apple = Ingredient.new("Apple")
peanuts = Ingredient.new("Peanuts")
noodle = Ingredient.new("Noodle")
tomato = Ingredient.new("Tomato")
oil = Ingredient.new("Oil")

masud=User.new("Masud")
roberto=User.new("Roberto")

allergen1 = Allergen.new(masud, apple)
allergen2 = Allergen.new(roberto, peanuts)
allergen3 = Allergen.new(masud, peanuts)

recipe_card1 = RecipeCard.new(masud, stew, 20180706, 2)
recipe_card2 = RecipeCard.new(masud, spaghetti, 20180707, 10)
recipe_card3 = RecipeCard.new(roberto, stew, 20180429, 5)
recipe_card4 = RecipeCard.new(masud, spaghetti, 20160705, 4)
recipe_card5 = RecipeCard.new(masud, stew, 20170509, 3)

recipe_ingredient1 = RecipeIngredient.new(spaghetti, noodle)
recipe_ingredient2 = RecipeIngredient.new(spaghetti, tomato)
recipe_ingredient3 = RecipeIngredient.new(spaghetti, oil)
recipe_ingredient4 = RecipeIngredient.new(stew, oil)
recipe_ingredient5 = RecipeIngredient.new(stew, tomato)
recipe_ingredient6 = RecipeIngredient.new(snack, peanuts)
recipe_ingredient7 = RecipeIngredient.new(snack, apple)

binding.pry
