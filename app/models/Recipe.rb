 require "pry"

class Recipe
  attr_accessor :recipe_name, :ingredients
  @@all = []

  def initialize(name)
    @recipe_name = name

    @@all << self
  end


  def recipe_card
    RecipeCard.all.select do |rec_card|
      rec_card.recipe == self
    end
  end

  def users
    recipe_card.map do |recipe|
      recipe.user
    end
  end

  def ingredients
    RecipeIngredient.all.select do |rec_ing|
      rec_ing.recipe == self
    end.map do |recipe|
      recipe.ingredient
    end
  end

  def allergens
    ingredients.map do |ingredient|
      ingredient.allergens
    end
  end

  def add_ingredients(array_of_ingredients)
    array_of_ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end

  def self.all
    @@all
  end

  def self.most_popular
    recipes = RecipeCard.all.map do |card|
      card.recipe
    end

    hash = Hash.new(0)
    recipes.each do |element|
      hash[element] += 1
    end
    re = hash.max_by{|key,value| value}.first
    re
    binding.pry
  end

end
