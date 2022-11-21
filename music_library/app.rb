require_relative 'lib/database_connection'

DatabaseConnection.connect('music_library')

result = DatabaseConnection.exec_params('SELECT * FROM artists;',[])

result.each do |record|
  p record
end