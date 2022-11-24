require_relative 'lib/database_connection'
require_relative 'lib/post_repository'
require_relative 'lib/post'

DatabaseConnection.connect('social_network')

post_repository = PostRepository.new

# post = post_repository.find(2)
# puts post.id
# puts post.title
# puts post.content
# puts post.number_of_views
# puts post.account_id

# new_post = Post.new
# new_post.title = 'Aloha!'
# new_post.content = 'aloha world'
# new_post.account_id = '2'
# post_repository.create(new_post)

post_repository.delete(3)

post_repository.all.each do |post|
  p post
end
