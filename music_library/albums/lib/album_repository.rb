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

  def find(id)
    sql = 'SELECT id, title, release_year FROM albums WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    album = Album.new
    album.id = record['id']
    album.title = record['title']
    album.release_year = record['release_year']

    return album
  end

  def create(album)
    sql = 'INSERT INTO albums (title, release_year) VALUES ($1, $2);'
    sql_params = [album.title, album.release_year]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end
end