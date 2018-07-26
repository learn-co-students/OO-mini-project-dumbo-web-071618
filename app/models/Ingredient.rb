class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  #reference to Recipe most_popular function
  # def self.most_popular
  #   recipe_cards_array = Recipe.all.map do |recipe|
  #     recipe.recipe_cards
  #   end
  #   new_array = recipe_cards_array.sort_by do |array|
  #     array.length
  #   end[-1]
  #   most_popular = new_array[0].recipe
  # end
  def self.most_common_allergen
    # new_hash = {}
    # Allergen.all.each do |allergen|
    #   if new_hash[allergen.ingredient]
    #     new_hash[allergen.ingredient] =+ 1
    #   else new_hash[allergen.ingredient] = 1
    #   end
    # end
    ingredient_array = Ingredient.all.map do |ing|
      ing.allergens
    end
    ingredient_array_new = ingredient_array.sort_by do |array|
      array.length
    end[-1]
    most_common = ingredient_array_new[0].ingredient

  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end
  end
end
