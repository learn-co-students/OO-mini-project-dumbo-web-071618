class RecipeCard
  attr_accessor :date,:rating,:user,:recipe,:name
  @@all = []

  def initialize attributes
    attributes.each do |key,value|
      self.send "#{key}=",value
    end

    # @name = name
    # @date = date
    # @rating = rating
    # @user = user
    # @recipe = recipe

    @@all << self
  end

  def self.all
    @@all
  end
end
