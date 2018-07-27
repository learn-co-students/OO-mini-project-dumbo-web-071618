require 'pry'

class User
  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_recipe_card(date, rating, recipe)
    RecipeCard.new(date, rating, self, recipe)
  end

  def recipes
    RecipeCard.all.select do |recipe|
      recipe.user == self
    end
  end

  def top_three_recipes
    sort_by_rating = recipes.sort_by do |recipe|
      recipe.rating
    end
    sort_by_rating[-3..-1]
  end

  def most_recent_recipe
    recipes.last
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergy|
      allergy.user == self
    end
  end



end
