require_relative 'account'

class AccountRepository
  def all
    # Executes the SQL query:
    sql = 'SELECT id, email_address, username FROM accounts'
    params = []
    result_set = DatabaseConnection.exec_params(sql, params)

    accounts = []

    # Returns an array of Account objects.

    result_set.each do |record|
      account = Account.new
      account.id = record['id']
      account.email_address = record['email_address']
      account.username = record['username']

      accounts << account
    end

    return accounts
  end

  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, email_address, username FROM accounts WHERE id = $1'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    # Returns a single Student object

    record = result_set[0]

    account = Account.new
    account.id = record['id']
    account.email_address = record['email_address']
    account.username = record['username']

    account
  end

  def create(account)
    # Execute the SQL query:
    sql = 'INSERT INTO accounts (email_address, username) VALUES ($1, $2);'
    params = [account.email_address, account.username]
    result_set = DatabaseConnection.exec_params(sql, params)

    return nil
    # Returns nothing
  end

   def delete(id)
    # Execute the SQL query:
    sql = 'DELETE FROM accounts WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    return nil
    # Returns nothing
  end
end