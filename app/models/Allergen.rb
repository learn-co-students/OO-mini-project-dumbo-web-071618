class Allergen

  @@all = []
  attr_accessor :name, :ingredient, :user

  def initialize(name, ingredient, user)
    @name = name
    @ingredient = ingredient
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  def add_allergen(user, i)
    
  end
end
