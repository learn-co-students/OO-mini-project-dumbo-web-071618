
class Ingredient

  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def allergys
    Allergen.all.select do |allergy|
      allergy.ingredient == self
    end
  end

  #have all the allergies

  def self.most_common_allergen
    allergy_counter = Allergen.all.map do |allergy|
      allergy.ingredient.allergys
    end

    common_allergen = allergy_counter.sort_by{ |allergy|
    allergy.length  }

    common_allergen.uniq.last[0]
  end



end
