class Allergen
  attr_accessor :user,:ingredient
  @@all = []

  def initialize attributes
    attributes.each do |key,value|
      self.send "#{key}=",value
    end
    # @name = name
    # @user = user
    # @ingredient = ingredient

    @@all << self
  end

  def self.all
    @@all
  end
end
