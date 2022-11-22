require_relative './album'

class AlbumRepository
  def all
    sql = 'SELECT id, title, release_year FROM albums'
    result_set = DatabaseConnection.exec_params(sql, [])

    albums = []

    result_set.each do |record|
      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']

      albums << album
    end

    return albums
  end
end