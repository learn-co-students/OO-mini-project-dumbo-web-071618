class Recipe
  attr_accessor :title
  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(ingredient,self)
    end
  end

  def ingredients
    RecipeIngredient.all.select do |ingredient|
      ingredient.recipe == self
    end
  end

  def users
    matching_recipe_cards = RecipeCard.all.select do |recipe_card|
      recipe_card.recipe == self
    end
    matching_recipe_cards.map do |recipe_card|
      recipe_card.user
    end
  end

  def self.most_popular
    all_recipe_cards = RecipeCard.all.map do |recipe_card|
      recipe_card.recipe
    end
    recipe_card_count = all_recipe_cards.sort_by do |recipe_card|
      all_recipe_cards.count(recipe_card)
    end
    recipe_card_count.last
  end

  def allergens
    found_recipe = RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  ingredients  = found_recipe.map do |recipe_items|
      recipe_items.ingredient
    end
    allergy_ingredients = Allergen.all.map do |allergy|
      allergy.ingredient
    end
    ingredients.select do |ingredient|
      allergy_ingredients.include?(ingredient)
    end
  end
end
