require_relative '../config/environment.rb'

scarlett = User.new("Scarlett")
derick = User.new("Derick")

beef = Ingredient.new("beef")
potato = Ingredient.new("potato")

chicken = Ingredient.new("chicken")
dumpling_skin = Ingredient.new("dumpling_skin")

shepherds_pie = Recipe.new("shepherds_pie")
dumplings = Recipe.new("dumplings")
chili = Recipe.new("chili")
pizza = Recipe.new("pizza")
pad_thai = Recipe.new("pad_thai")

strawbery = Ingredient.new("strawbery")
milk = Ingredient.new("milk")
flour = Ingredient.new("flour")

pasta_shells = Ingredient.new("pasta_shells")
ricotta_cheese = Ingredient.new("ricotta_cheese")

stuffed_shells = Recipe.new("stuffed_shells")
strawberry_sorbet = Recipe.new("strawberry_sorbet")
flan = Recipe.new("flan")
banana_shake = Recipe.new("banana_shake")
pancakes = Recipe.new("pancakes")

scarlett.add_recipe_card("Thu", 10, shepherds_pie)
scarlett.add_recipe_card("Fri", 9, dumplings)
scarlett.add_recipe_card("Sat", 8, chili)
scarlett.add_recipe_card("Sun", 7, pizza)
scarlett.add_recipe_card("Mon", 6, pad_thai)
scarlett.add_recipe_card("Tue", 13, pancakes)

derick.add_recipe_card("Fri", 9, stuffed_shells)
derick.add_recipe_card("Sat", 10, strawberry_sorbet)
derick.add_recipe_card("Sun", 11, flan)
derick.add_recipe_card("Mon", 12, banana_shake)
derick.add_recipe_card("Tue", 13, pancakes)

scarlett.recipes
derick.recipes

scarlett.top_three_recipes
derick.top_three_recipes

scarlett.most_recent_recipe
derick.most_recent_recipe

shepherds_pie.add_ingredients([beef, potato])
shepherds_pie.ingredients
strawberry_sorbet.add_ingredients([strawbery, milk])

pancakes.users

derick.declare_allergen(strawbery)
derick.declare_allergen(milk)
scarlett.declare_allergen(strawbery)
derick.allergens
strawberry_sorbet.allergens

binding.pry
