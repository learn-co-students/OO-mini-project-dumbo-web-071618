class Recipe
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
  end

  def self.most_popular
    recipe_cards_array = Recipe.all.map do |recipe|
      recipe.recipe_cards
    end
    new_array = recipe_cards_array.sort_by do |array|
      array.length
    end[-1]
    most_popular = new_array[0].recipe
  end

  def users
    self.recipe_cards.map do |recipe_card|
      recipe_card.user
    end.uniq
  end

  def ingredients
    recipe_ingredients = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
    recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end
  end

  def allergens
    self.ingredients.select do |ingredient|
      ingredient.allergens.empty? != true
    end
  end

  def add_ingredients (ingredients_array)
    ingredients_array.map do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end
end
