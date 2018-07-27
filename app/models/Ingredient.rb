class Ingredient
  attr_accessor :ingredient_name, :recipes
  @@all = []

  def initialize(ingredient_name)
    @ingredient_name = ingredient_name

    @@all << self
  end

  def self.all
    @@all
  end



  def allergens #=> [Array of allergens]
    Allergen.all.select do |allergen|
      allergen.ingredient = self
    end
  end

  def users #=> [Array of users]
    arrayOfAllergen = self.allergens
    arrayOfAllergen.map do |allergen|
      allergen.user
    end
  end

  def self.most_common_allergen
    sorted_ingredient_array = Ingredient.all.sort_by do |ingredient|
      users = ingredient.users
      users.length #=> Number
    end
    sorted_ingredient_array[-1]
  end

end
