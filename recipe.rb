# This is the model
class Recipe
  def initialize(name, description)
    @name = name
    @description = description
  end

  attr_reader :name, :description
end
