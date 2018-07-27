class Recipe
  attr_accessor :name
  @@all = []

  def initialize name:
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    highest_count = 0
    highest_count_obj = nil
    Recipe.all.each do |recipe|
      count = RecipeCard.all.select do |card|
        card.recipe == recipe
      end.length
      # binding.pry
      if count > highest_count
        highest_count = count
        highest_count_obj = recipe
      end
    end
    return highest_count_obj
  end

  def users
    RecipeCard.all.select do |card|
      card.recipe == self
    end.map do |card|
      card.user
    end
  end

  def ingredients
    RecipeIngredient.all.select do |rI|
      rI.recipe == self
    end.map do |rI|
      rI.ingredient
    end
  end

  def allergens
    array = Allergen.all
    array.map!{|allergen| allergen.ingredient }
    self.ingredients.select do |ing|
      array.include?(ing)
    end
  end

  def add_ingredients(array)
    array.each do |ing|
      RecipeIngredient.new(recipe: self, ingredient: ing)
    end
  end

end
