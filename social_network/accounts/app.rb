require_relative 'lib/database_connection'
require_relative 'lib/account_repository'
require_relative 'lib/account'

DatabaseConnection.connect('social_network')

account_repository = AccountRepository.new

# account = account_repository.find(2)
# puts account.id
# puts account.email_address
# puts account.username

# new_account = Account.new
# new_account.email_address = 'aloha@world.com'
# new_account.username = 'alohaworld'
# new_account.account_id = '3'
# account_repository.create(new_account)

# account_repository.delete(3)

account_repository.all.each do |account|
  p account
end
