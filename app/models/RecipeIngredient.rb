class RecipeIngredient
  attr_accessor :ingredient, :recipe
  @@all = []

  def initialize attributes
    attributes.each do |key,value|
      self.send "#{key}=",value
    end

    # @name = name
    # @ingredient = ingredient
    # @recipe = recipe

    @@all << self
  end

  def self.all
    @@all
  end
end
