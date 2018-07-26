require_relative '../config/environment.rb'

john_nash = User.new("John Nash")
chef_hanz = User.new("Chef Hanz")
chef_kos = User.new("Chef Kos")

soup = Recipe.new("soup")
chop_cheese = Recipe.new("chop cheese")
soup_card = RecipeCard.new("soup card", soup, chef_hanz, "Today", 9)
soup_card = RecipeCard.new("soup card", chop_cheese, chef_hanz, "Today", 9)
sandwhich = RecipeCard.new("soup card", chop_cheese, chef_kos, "Today", 9)

# add_recipe_card
#
#

binding.pry

"something"
