require_relative '../config/environment.rb'

#recipe
pbnj = Recipe.new name: "PB and J sandwich"
ham = Recipe.new name: "Ham sandwich"
gc = Recipe.new name: "Grilled cheese sandwich"
#user
josue = User.new name: "Josue"
bryan = User.new name: "Bryan"
rosa = User.new name: "Rosa"

#ingredient
pb = Ingredient.new name: "peanut butter"
jelly = Ingredient.new name: "jelly"
shellfish = Ingredient.new name: "shellfish"

#recipe card , @name = name, @date = date, @rating = rating, @user = user, @recipe = recipe
pbnj_RC = RecipeCard.new name: "card1", date: Time.new(2000), rating: 9 , user: josue, recipe: pbnj
ham_RC = RecipeCard.new name: "card2", date: Time.new(2001), rating: 3 , user: josue, recipe: ham
gc_RC = RecipeCard.new name: "card3", date: Time.new(2002), rating: 10 , user: josue, recipe: gc
gc1_RC = RecipeCard.new name: "card4", date: Time.new(2003), rating: 7 , user: bryan, recipe: gc
gc2_RC = RecipeCard.new name: "card5", date: Time.new(2004), rating: 6 , user: rosa, recipe: gc

#allergen
allergen1 = Allergen.new user: josue, ingredient: pb
allergen2 = Allergen.new user: bryan, ingredient: shellfish
allergen3 = Allergen.new user: rosa, ingredient: shellfish


#recipe ingredient
pb_RI = RecipeIngredient.new ingredient: pb, recipe: pbnj
jelly_RI = RecipeIngredient.new ingredient: jelly, recipe: pbnj
binding.pry
