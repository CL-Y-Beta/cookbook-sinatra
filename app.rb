require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"


require_relative 'cookbook'
require_relative 'recipe'

set :bind, "0.0.0.0"

# get "/" do
#   erb :index
# end

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)

get "/" do
  @recipes = cookbook.all
  erb :index
end

get "/new" do
  erb :new
  # new_recipe = cookbook.create
end

post "/recipes" do
  # new_recipe = cookbook.create
  cookbook.create(Recipe.new(params[:name], params[:description]))
  redirect to '/'
end

get "/delete/:index" do
  # p params[:id]
  # new_recipe = cookbook.create
  cookbook.destroy(params[:index].to_i + 1)
  redirect to '/'
end
