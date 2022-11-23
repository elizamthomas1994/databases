require_relative 'recipe'

class RecipeRepository
  def all

    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
    results = DatabaseConnection.exec_params(sql, [])

    recipes = []  
    
    results.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time'].to_i
      recipe.rating = record['rating'].to_i

      recipes << recipe
    end
    return recipes
    p "#{recipes}"
  end
  
    
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;
  
    # Returns a single Recipe object.
    sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    record = result[0]

    p record

    recipe = Recipe.new
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.cooking_time = record['cooking_time']
    recipe.rating = record['rating']

    return recipe
  end 
end
  