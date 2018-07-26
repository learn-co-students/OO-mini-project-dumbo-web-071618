class User

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def user_info_cards
    RecipeCard.all.select do |card|
      card.user == self
    end
  end

  def recipes
    user_info_cards.map do |card|
      card.recipe
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new("#{recipe.name} card", recipe, self, date, rating)

  end

  def top_three_recipes
    top_3 = user_info_cards. sort_by {|recipe| recipe.rating}
    top_3.reverse[0..2]
  end

  def most_recent_recipe
    recipes.last
  end

  def allergens
    Allergen.all.select do |allergy|
      allergy.user == self
    end
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient.name, ingredient, self)
  end

end
