require_relative '../config/environment.rb'

recipe1 = Recipe.new
recipe2 = Recipe.new
recipe3 = Recipe.new
recipe4 = Recipe.new
recipe5 = Recipe.new
banana = Ingredient.new
milk = Ingredient.new
egg = Ingredient.new
apple = Ingredient.new
arr = [banana, milk, egg, apple]
user1 = User.new
user2 = User.new
user3 = User.new
user4 = User.new
user5 = User.new
user1.add_recipe_card(recipe1, "July 29", 1)
user1.add_recipe_card(recipe2, "July 28", 5)
user1.add_recipe_card(recipe3, "July 27", 3)
user1.add_recipe_card(recipe4, "July 26", 2)
user1.add_recipe_card(recipe5, "July 26", 4)
user2.add_recipe_card(recipe5, "July 26", 4)
user3.add_recipe_card(recipe5, "July 26", 4)
recipe1.add_ingredients(arr)
user1.declare_allergen(apple)
user1.declare_allergen(milk)
user2.declare_allergen(milk)
user3.declare_allergen(apple)
user4.declare_allergen(apple)
user5.declare_allergen(apple)

binding.pry
