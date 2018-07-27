class User

    @@all = []
    def initialize
        @@all << self
    end
    def self.all
        @@all
    end
    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(user: self, rating: rating, date: date, recipe: recipe)
    end
    def my_recipe_cards
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end
    end
    def recipes
        my_recipe_cards.map do |recipe_card|
            recipe_card.recipe
        end
    end
    def top_three_recipes
        my_recipe_cards.sort_by do |recipe_card|
            recipe_card.rating
        end.map do |recipe_card|
            recipe_card.recipe
        end[-3..-1]
    end
    def most_recent_recipe
        self.recipes[-1]
    end
    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end
    def allergens
        Allergen.all.select do |allergen|
            allergen.user == self
        end.map do |allergen|
            allergen.ingredient
        end
    end
    def safe_recipes
        recipes.select do |recipe|
            recipe.allergens
        end
    end
end
