class User
  attr_accessor :name, :user
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def recipes
    RecipeCard.all.select do |rec|
      rec.user == self
    end
  end

  def add_recipe_card(date, recipe, rating)
    new_recipe_card = RecipeCard.new(date, rating, self, recipe )
    new_recipe_card
  end

  def allergens
    Allergen.all.select do |allergy|
      allergy.user == self
    end
  end

  def declare_allergen(name,ingredient)
      new_allergy = Allergen.new(name, self, ingredient)
      new_allergy
  end

end
