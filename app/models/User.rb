require 'pry'

class User
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    recipes = RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end
    recipes.map do |recipe|
      recipe.recipe
    end.uniq
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    user_allergens = Allergen.all.select do |allergen|
      allergen.user == self
    end
    user_allergic_ingredients = user_allergens.map do |allergen|
      allergen.ingredient
    end
    return user_allergic_ingredients.uniq
  end

  def top_three_recipes
    recipe_cards = RecipeCard.all.select do |recipe|
      recipe.user == self
    end
    sorted_cards = recipe_cards.sort_by do |recipe|
      recipe.rating
    end.reverse[0..2]
  end

  def most_recent_recipe
    recipe_cards = RecipeCard.all.select do |recipe|
      recipe.user == self
    end
    sorted_cards = recipe_cards.sort_by do |recipe|
      recipe.date
    end.reverse[0]
  end

#  BONUS
  def safe_recipes
    ingredients_by_recipe_array = Recipe.all.map do |recipe|
      recipe.ingredients
    end
    safe_recipes_no_name = ingredients_by_recipe_array.select do |ingredient_in_recipe|
      self.allergens.collect do |allergen|
        if ingredient_in_recipe.include?(allergen)
          ingredients_by_recipe_array.delete(ingredient_in_recipe)
        end
      end
    end
  end

    # Recipe.all.select do |recipe|
    #   safe_recipes_no_name.each do |y|
    #     recipe.ingredients == y
        final_array=[]
        Recipe.all.each do |recipe|
          safe_recipes_no_name.each do |y|
            if recipe.ingredients == y
              final_array << recipe
            end
          end
        end
        final_array

end
