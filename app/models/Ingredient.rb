class Ingredient

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def allergens
        Allergen.all.select do |allergen|
            allergen.ingredient == self
        end
    end

    def users
        allergens.map do |allergen|
            allergen.user
        end
    end

    def self.most_common_allergen
        # self.all.sort_by do |allergen|
        #     allergen.users.length
        # end[-1]
        i = Allergen.all.map do |allergen|
            allergen.ingredient
        end
        i.sort_by do |el|
            i.count(el)
        end[-1]

    end
end
