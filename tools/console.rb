require_relative '../config/environment.rb'

sam = User.new("Sam")
natsuki = User.new("Natsuki")
kyle = User.new("Kyle")
prince = User.new("Prince")

curry = Recipe.new("Curry")
sushi = Recipe.new("Sushi")
ramen = Recipe.new("Ramen")
pork_bun = Recipe.new("Pork Bun")
ice_cream = Recipe.new("Ice Cream")

rec_card1 = RecipeCard.new("July 4","1 Stars", sam, ramen)
rec_card2 = RecipeCard.new( "April 4",  "4 Stars", natsuki, curry)
rec_card3 = RecipeCard.new( "July 25",  "3.5 Stars", prince, pork_bun)
rec_card4 = RecipeCard.new( "July 8",  "5 Stars", kyle, sushi)
rec_card5 = RecipeCard.new( "August 5",  "4.5 Stars", kyle, ramen)

kyle.add_recipe_card("November 11", "3.3 Stars", ice_cream)

milk = Ingredient.new("milk")
noodles = Ingredient.new("Noodles")
pork = Ingredient.new("Pork")


rec_ing1 = RecipeIngredient.new(curry, pork)
rec_ing2 = RecipeIngredient.new(ice_cream, milk)
rec_ing3 = RecipeIngredient.new(noodles, pork)

hives = Allergen.new("Hives", prince, pork)
rash = Allergen.new("Hives", prince, pork)
sniffles = Allergen.new("Sniffle", natsuki, noodles)
cough = Allergen.new("Cough", kyle, milk)


binding.pry

# hash = {}
#
# array.each do |ele|
#   if hash[:curry]
#     hash[:curry] += 1
#   else
#     hash[:curry] = 1
#   end
