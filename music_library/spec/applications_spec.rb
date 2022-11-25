require 'application'
require './albums/lib/album_repository'
require './artists/lib/artist_repository'

RSpec.describe Application do
  context 'user selects to see list of albums' do
    it 'outputs all entries within a given table' do
      io = double :io

      album_repo = AlbumRepository.new
      artist_repo = ArtistRepository.new

      albums = album_repo.all
      artists = artist_repo.all

      expect(io).to receive(:puts).with("Welcome to the music library manager!")
      expect(io).to receive(:puts).with("What would you like to do?")
      expect(io).to receive(:puts).with("1 - List all albums")
      expect(io).to receive(:puts).with("2 - List all artists")
      expect(io).to receive(:puts).with("Enter your choice:")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Here is the list of albums:")
      expect(io).to receive(:puts).with("1 - Doolittle")
      expect(io).to receive(:puts).with("2 - Surfer Rosa")
      expect(io).to receive(:puts).with("3 - Waterloo")
      expect(io).to receive(:puts).with("4 - Super Trouper")
      expect(io).to receive(:puts).with("5 - Bossanova")
      expect(io).to receive(:puts).with("6 - Lover")
      expect(io).to receive(:puts).with("7 - Folklore")
      expect(io).to receive(:puts).with("8 - I Put a Spell on You")
      expect(io).to receive(:puts).with("9 - Baltimore")
      expect(io).to receive(:puts).with("10 - Here Comes the Sun")
      expect(io).to receive(:puts).with("11 - Fodder on My Wings")
      expect(io).to receive(:puts).with("12 - Ring Ring")

      app = Application.new('music_library', io, album_repo, artist_repo)
      app.run
    end
  end

  context 'user selects to see list of artists' do
    it 'outputs all entries within a given table' do
      io = double :io

      album_repo = AlbumRepository.new
      artist_repo = ArtistRepository.new

      artists = artist_repo.all
      artists = artist_repo.all

      expect(io).to receive(:puts).with("Welcome to the music library manager!")
      expect(io).to receive(:puts).with("What would you like to do?")
      expect(io).to receive(:puts).with("1 - List all albums")
      expect(io).to receive(:puts).with("2 - List all artists")
      expect(io).to receive(:puts).with("Enter your choice:")
      expect(io).to receive(:gets).and_return("2")
      expect(io).to receive(:puts).with("Here is the list of artists:")
      expect(io).to receive(:puts).with("1 - Pixies")
      expect(io).to receive(:puts).with("2 - ABBA")
      expect(io).to receive(:puts).with("3 - Taylor Swift")
      expect(io).to receive(:puts).with("4 - Nina Simone")

      app = Application.new('music_library', io, artist_repo, artist_repo)
      app.run
    end
  end
end