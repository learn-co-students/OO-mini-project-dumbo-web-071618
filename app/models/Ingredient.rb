class Ingredient
  attr_accessor :name
  @@all = []

  def initialize name:
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    highest_count = 0
    highest_count_obj = nil
    array_of_ingredients = []

    User.all.each do |user|
      array_of_ingredients << user.allergens
    end

    arr = array_of_ingredients.flatten.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    arr.each do |allergen,count|
      if count > highest_count
        highest_count = count
        highest_count_obj = allergen
      end
    end
    highest_count_obj
  end
end
