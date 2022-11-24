require 'account_repository'

RSpec.describe AccountRepository do
  def reset_accounts_table
    seed_sql = File.read('spec/seeds_accounts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_accounts_table
  end

  describe '#all' do
    it 'returns all account objects in accounts table' do
      repo = AccountRepository.new

      accounts = repo.all

      expect(accounts.length).to eq 2
      expect(accounts.first.id).to eq '1'
      expect(accounts.first.email_address).to eq 'hello@world.com'
      expect(accounts.first.username).to eq 'helloworld'
      expect(accounts.first.account_id).to eq '1'
      expect(accounts[1].id).to eq '2'
      expect(accounts[1].email_address).to eq 'hola@mundo.com'
      expect(accounts[1].username).to eq 'holamundo'
      expect(accounts[1].account_id).to eq '2'
    end
  end

  describe '#find' do
    it 'returns a specific account object within accounts table' do
      repo = AccountRepository.new

      account = repo.find(1)

      expect(account.id).to eq '1'
      expect(account.email_address).to eq 'hello@world.com'
      expect(account.username).to eq 'helloworld'
      expect(account.account_id).to eq '1'
    end
  end

  describe '#create' do
    it 'inserts a newly created account object into the accounts table' do
      repo = AccountRepository.new

      new_account = Account.new
      new_account.email_address = 'bonjour@monde.com'
      new_account.username = 'bonjourmonde'
      new_account.account_id = '3'

      repo.create(new_account)

      all_accounts = repo.all

      expect(all_accounts).to include(
        have_attributes(
          email_address: new_account.email_address,
          username: new_account.username,
          account_id: new_account.account_id
        )
      )
    end
  end

  describe '#delete' do
    it 'removes a pre-existing account object from the accounts table' do
      repo = AccountRepository.new

      # Delete the student with id=1
      repo.delete(1)

      accounts = repo.all
      expect(accounts[0].id).to eq '2'
      expect(accounts[0].email_address).to eq 'hola@mundo.com'
      expect(accounts[0].username).to eq 'holamundo'
      expect(accounts[0].account_id).to eq '2'
    end
  end
end