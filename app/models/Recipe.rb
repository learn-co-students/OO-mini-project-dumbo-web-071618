class Recipe

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end



  def recipe_users
    users = recipe_cards.collect do |card|
      card.user
    end
    users.uniq
  end

  def ingredients
    recipe_ingredients  = RecipeIngredient.all.select do |ingredient|
      ingredient.recipe == self
    end

    recipe_ingredients.map do |recipe_ingredient|
      recipe_ingredient.ingredient
    end

  end

  def recipe_cards
    RecipeCard.all.select do |card|
      card.recipe == self
    end
  end

  def self.most_popular
    recipe_counts = RecipeCard.all.collect do |card|
      card.recipe.recipe_cards
    end
    most_popular = recipe_counts.sort_by {|recipe|
      recipe.length}
    most_popular.uniq.reverse[0][0]
  end

  def add_ingredients (ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(ingredient.name, ingredient, self)
    end
  end



end
