class User
  attr_accessor :name
  @@all = []

  def initialize name:
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select do |card|
      card.user == self
    end.map do |card|
      card.recipe
    end
  end

  def add_recipe_card(recipe,date,rating)
    RecipeCard.new(recipe: recipe,date: date,rating: rating,user: self)
  end

  def declare_allergen(ingredient)
    Allergen.new(user: self, ingredient: ingredient)
  end

  def allergens
    #returns all the ingrediences that the instance is allergic to
    Allergen.all.select do |allergen|
      allergen.user == self
    end.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    array = RecipeCard.all.select{ |card| card.user == self}.sort_by{ |card| card.rating}
    if array.length < 3
      array.reverse
    else
      array[-3..-1].reverse
    end
  end

  def most_recent_recipe
    RecipeCard.all.select do |card|
      card.user == self
    end.sort_by do |card|
      card.date
    end.last.recipe
  end

  def safe_recipes
    safe = Recipe.all

    ings_with_allergens = self.allergens

    safe.each do |recipe|
      ings_with_allergens.each do |ing|
        if recipe.ingredients.include?(ing)
          safe.delete(recipe)
        end
      end
    end
  safe
  end
end
