require_relative 'recipe'
require 'csv'
# This is the repository.
class Cookbook
  def initialize(csv_file_path)
    # initialize(csv_file_path) which loads existing Recipe from the CSV
    @filepath = csv_file_path
    @recipes = []
    CSV.foreach(@filepath) do |row|
      @recipes << Recipe.new(row[0], row[1]) ## Need more explanation for this part...
    end
  end
  attr_reader :recipes

  def all
    # all which returns all the recipes
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    CSV.open(@filepath, "wb") do |csv|
      @recipes.each do |row|
        csv << [row.name, row.description]
      end
    end
    @recipes
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index - 1)
    CSV.open(@filepath, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
