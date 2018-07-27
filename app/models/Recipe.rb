class Recipe
    
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_cards
        RecipeCard.all.select do |recipe_card|
            recipe_card.recipe == self
        end
    end

    def users
        recipe_cards.map do |recipe_card|
            recipe_card.user
        end
    end

    def self.most_popular
        self.all.sort_by do |recipe|
            recipe.users.length
        end[-1]
    end 
    
    def add_ingredients(ingredients)
        ingredients.each do |ingr|
            RecipeIngredient.new(self, ingr)
        end
    end

    def ingredients
        RecipeIngredient.all.select do |recipe_ingredient|
            recipe_ingredient.recipe == self
        end.map do |recipe_ingredient|
            recipe_ingredient.ingredient
        end
    end

    def allergens
        Allergen.all.select do |allergen|
            ingredients.include?(allergen.ingredient) 
        end.map do |allergen|
            allergen.ingredient
        end.uniq
    end
end