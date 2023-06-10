require_relative 'recipe'
class View
  def display_list(list)
    list.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}"
      puts recipe.description
    end
  end

  def ask_for_name
    puts "Recipe name:"
    gets.chomp
  end

  def ask_for_description
    puts "Description?"
    gets.chomp
  end

  def ask_for_index
    puts "Which index would you like the delete?"
    gets.chomp.to_i
  end

  def ask_search_index
    puts "Which index would you like to add?"
    gets.chomp.to_i
  end

  def keyword
    puts "What would you like to search for?"
    gets.chomp
  end

  def display_searched_recipes(potential_recipes)
    potential_recipes.each do |recipe|
      puts "#{recipe.index}. #{recipe.name}"
    end
  end
end
