require 'recipe_repository'

RSpec.describe RecipeRepository do
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end
  
  describe RecipeRepository do
    before(:each) do 
      reset_recipes_table
    end
  
    # (your tests will go here).
  end

  describe '#all' do
    it 'returns every instance of recipe' do
      repo = RecipeRepository.new

      recipes = repo.all

      expect(recipes.length).to eq 2

      expect(recipes[0].id).to eq '1'
      expect(recipes[0].name).to eq 'Salmon en Croute'
      expect(recipes[0].cooking_time).to eq '60'
      expect(recipes[0].rating).to eq '10'

      expect(recipes[1].id).to eq '2'
      expect(recipes[1].name).to eq 'Chocolate Cake'
      expect(recipes[1].cooking_time).to eq '20'
      expect(recipes[1].rating).to eq '9'
    end
  end
end
