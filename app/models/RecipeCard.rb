class RecipeCard

    @@all = []
    attr_accessor :user, :rating, :date, :recipe

    def initialize(user:, rating:, date:, recipe:)
        @user = user
        @rating = rating
        @date = date
        @recipe = recipe
        @@all << self
    end

    def self.all
        @@all
    end
end