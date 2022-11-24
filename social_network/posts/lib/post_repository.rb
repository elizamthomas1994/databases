require_relative 'post'

class PostRepository
  def all
    # Executes the SQL query:
    sql = 'SELECT id, title, content, number_of_views, account_id FROM posts;'
    params = []
    result_set = DatabaseConnection.exec_params(sql, params)

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.number_of_views = record['number_of_views']
      post.account_id = record['account_id']

      posts << post
    end

    return posts
  end

  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, title, content, number_of_views, account_id FROM posts WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    record = result_set[0]

    post = Post.new
    post.id = record['id']
    post.title = record['title']
    post.content = record['content']
    post.number_of_views = record['number_of_views']
    post.account_id = record['account_id']
    
    return post
  end

  def create(post)
    # Execute the SQL query:
    sql = 'INSERT INTO posts(title, content, number_of_views, account_id) VALUES ($1, $2, $3, $4);'
    params = [post.title, post.content, post.number_of_views, post.account_id]
    result_set = DatabaseConnection.exec_params(sql, params)

    return nil
  end

   def delete(id)
    # Execute the SQL query:
    sql = 'DELETE FROM posts WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    return nil
  end
end