require './app'
require './create_music_album'
require './create_genre'
require './music_album'
require './lists'
require './genre'
require './item'
require './preserve_data'

MENU = <<~MLS.freeze
  1. List all books
  2. List all music albums
  3. List all movies
  4. List all games
  5. List all genres
  6. List all labels
  7. List all authors
  8. List all sources
  9. Add a book
  10. Add a music album
  11. Add a movie
  12. Add a game
  13. Exit
MLS

CHOICES = {
  1 => 'list_all_books',
  2 => 'list_all_music_albums',
  3 => 'list_all_movies',
  4 => 'list_all_games',
  5 => 'list_all_genres',
  6 => 'list_all_labels',
  7 => 'list_all_authors',
  8 => 'list_all_sources',
  9 => 'add_book',
  10 => 'add_music_album',
  11 => 'add_movie',
  12 => 'add_game'
}.freeze

class Main
  def initialize
    @app = App.new
    puts 'Welcome to the Media Library'
    puts '****************************'
    load
    loop do
      puts MENU
      input = gets.chomp.to_i
      case input
      when 1..12
        @app.send(CHOICES[input])
      when 13
        save
        puts 'Thank you for using the Media Library'
        break
      else
        puts 'Invalid choice, Please input a number between 1 and 13'
      end
    end
  end

  def load
    @app.load_games
    @app.load_authors
    PreserveData.load_genres
    PreserveData.load_albums(@app.genres)
    @app.load_books
  end

  def save
    @app.store_games
    @app.store_authors
    PreserveData.store_genres(@app.genres)
    PreserveData.store_albums(@app.music_albums)
    @app.store_books
  end
end

Main.new
