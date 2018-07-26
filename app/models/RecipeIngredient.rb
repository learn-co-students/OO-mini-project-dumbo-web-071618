class RecipeIngredient

  @@all = []
  attr_accessor :name, :ingredient, :recipe

  def initialize(name, ingredient, recipe)
    @name = name
    @ingredient = ingredient
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end
  
end
