require './game'
require './author'
require 'json'
require './create_music_album'
require './create_genre'
require './music_album'
require './lists'
require './genre'
require './item'
require './preserve_data'

class App
  attr_accessor :music_albums, :genres

  def initialize
    @games = []
    @authors = []
    @genres = PreserveData.load_genres
    @music_albums = PreserveData.load_albums(@genres)
  end

  def store_games
    games = @games.map do |game|
      { label: game.label, publish_date: game.publish_date, multiplayer: game.multiplayer,
        last_played: game.last_played }
    end
    games = JSON.generate(games)
    File.write('./store/games.json', games)
  end

  def store_authors
    authors = @authors.map { |author| { first_name: author.first_name, last_name: author.last_name } }
    authors = JSON.generate(authors)
    File.write('./store/authors.json', authors)
  end

  def load_games
    return unless File.exist?('./store/games.json')

    games = File.read('./store/games.json')
    games = JSON.parse(games)
    games.each do |game|
      game = Game.new(game['publish_date'], game['multiplayer'], game['last_played'])
      @games << game
    end
  end

  def load_authors
    return unless File.exist?('./store/authors.json')

    authors = File.read('./store/authors.json')
    authors = JSON.parse(authors)
    authors.each do |author|
      author = Author.new(author['first_name'], author['last_name'])
      @authors << author
    end
  end

  def list_all_games
    @games.map { |game| puts "Game: #{game.label}, Publish Date: #{game.publish_date}" }
    puts '************************'
    puts
  end

  def list_all_authors
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. #{author.first_name} #{author.last_name}"
    end
    puts '************************'
    puts
  end

  def add_game
    puts 'Enter Publish Date [YYYY]:'
    publish_date = gets.chomp
    puts 'Enter Multiplayer [true/false]:'
    multiplayer = gets.chomp
    puts 'Enter Last Played [YYYY]:'
    last_played = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played)
    puts 'Enter Author\'s First Name:'
    first_name = gets.chomp
    puts 'Enter Author\'s Last Name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    game.add_author(author)
    author.add_item(game)
    @games << game
    @authors << author
  end

  def add_music_album
    AlbumCreator.new.create_album(@music_albums, @genres)
  end

  def list_all_music_albums
    List.new.list_all_music_albums(@music_albums)
  end

  def list_all_genres
    List.new.list_all_genres(@genres)
  end
end
