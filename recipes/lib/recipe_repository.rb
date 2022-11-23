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
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end
    return recipes
    p "#{recipes}"
  end

  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;

    # Returns a single Recipe object.
  end
  
    
    # def find(id)
    #   # Executes the SQL query:
    #   # SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;
  
    #   # Returns a single Recipe object.
    # end 
end
  