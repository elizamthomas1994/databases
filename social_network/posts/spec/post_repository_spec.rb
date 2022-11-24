require 'post_repository'

RSpec.describe PostRepository do
  def reset_posts_table
    seed_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_posts_table
  end
  
  describe '#all' do
    it 'returns all objects of post within the posts library' do
      repo = PostRepository.new

      posts = repo.all

      expect(posts.length).to eq 2
      expect(posts.first.id).to eq '1'
      expect(posts.first.title).to eq 'Hello!'
      expect(posts.first.content).to eq 'hello world'
      expect(posts.first.number_of_views).to eq '100'
      expect(posts.first.account_id).to eq '2'
      expect(posts[1].id).to eq '2'
      expect(posts[1].title).to eq 'Hola!'
      expect(posts[1].content).to eq 'hola mundo'
      expect(posts[1].number_of_views).to eq '1000'
      expect(posts[1].account_id).to eq '2'
    end
  end

  describe '#find' do
    it 'returns a specific post object within the posts library' do
      repo = PostRepository.new

      post = repo.find(1)

      expect(post.title).to eq 'Hello!'
      expect(post.content).to eq 'hello world'
      expect(post.number_of_views).to eq '100'
      expect(post.account_id).to eq '2'
    end
  end

  describe '#create' do
    it 'inserts a new post object into the posts library' do
      repo = PostRepository.new

      new_post = Post.new
      new_post.title = 'Bonjour!'
      new_post.content = 'Bonjour monde'
      new_post.number_of_views = '300'
      new_post.account_id = '2'

      repo.create(new_post)

      all_posts = repo.all

      expect(all_posts).to include(
        have_attributes(
          title: new_post.title,
          content: new_post.content,
          number_of_views: new_post.number_of_views,
          account_id: new_post.account_id
        )
      )
    end
  end

  describe '#delete' do
    it 'removes a post object from the posts library' do
      repo = PostRepository.new

      repo.delete(1)

      all_posts = repo.all

      expect(all_posts.first.id).to eq '2'
      expect(all_posts.first.title).to eq 'Hola!'
      expect(all_posts.first.content).to eq 'hola mundo'
      expect(all_posts.first.number_of_views).to eq '1000'
      expect(all_posts.first.account_id).to eq '2'
    end
  end
end