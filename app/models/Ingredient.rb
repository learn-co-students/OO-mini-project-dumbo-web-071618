class Ingredient
  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    ingredient_list  = Allergen.all.map do |allergy|
      allergy.ingredient
    end
    sorted_ingredient = ingredient_list.sort_by do |ingredient|
      ingredient_list.count(ingredient)
    end
    sorted_ingredient.last
  end

end
