require 'json'
require './game'
require './author'
require './create_music_album'
require './create_genre'
require './music_album'
require './lists'
require './genre'
require './item'
require './preserve_data'
require './book'
require './label'

class App
  attr_accessor :music_albums, :genres

  def initialize
    @books = []
    @games = []
    @authors = []
    @genres = PreserveData.load_genres
    @music_albums = PreserveData.load_albums(@genres)
  end

  def store_games
    games = @games.map do |game|
      { label: game.label[0].name, publish_date: game.publish_date, multiplayer: game.multiplayer,
        last_played: game.last_played, author: "#{game.author[0].first_name} #{game.author[0].last_name}" }
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
      new_game = Game.new(game['publish_date'], game['multiplayer'], game['last_played'])
      first_name = game['author'].split[0]
      last_name = game['author'].split[1]
      author = Author.new(first_name, last_name)
      new_game.add_author(author)
      label = Label.new(game['label'])
      new_game.add_label(label)
      @games << new_game
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
    @games.map do |game|
      puts "Game: #{game.label[0].name}, Publish Date: #{game.publish_date}",
           "Multiplayer: #{game.multiplayer}, Last Played: #{game.last_played},
           author: #{game.author[0].first_name} #{game.author[0].last_name}"
    end
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
    puts 'Enter the title'
    title = gets.chomp
    puts 'Enter Publish Date [YYYY]:'
    publish_date = gets.chomp
    puts 'Enter Multiplayer [true/false]:'
    multiplayer = gets.chomp
    puts 'Enter Last Played [YYYY]:'
    last_played = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played)
    label = Label.new(title)
    game.add_label(label)
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

  def add_book
    puts 'Please enter the title'
    title = gets.chomp
    puts 'Please enter the publish date [YYYY]'
    publish_date = gets.chomp
    puts 'Please enter the publisher'
    publisher = gets.chomp
    puts 'Please enter the cover state [good/bad]'
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title)
    book.add_label(label)
    @books << book
    puts 'Book added successfully'
    puts '************************'
    puts
  end

  def list_all_books
    @books.map do |book|
      puts "Book: #{book.label[0].name}, Publish Date: #{book.publish_date}",
           "Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
    puts '************************'
    puts
  end

  def store_books
    books = @books.map do |book|
      { label: book.label[0].name, publish_date: book.publish_date, publisher: book.publisher,
        cover_state: book.cover_state }
    end
    books = JSON.generate(books)
    File.write('./store/books.json', books)
  end

  def load_books
    return unless File.exist?('./store/books.json')

    books = File.read('./store/books.json')
    books = JSON.parse(books)
    books.each do |book|
      new_book = Book.new(book['publish_date'], book['publisher'], book['cover_state'])
      label = Label.new(book['label'])
      new_book.add_label(label)
      @books << new_book
    end
  end

  def list_all_labels
    Label.all.each_with_index do |label, index|
      puts "#{index + 1}. #{label.name} (#{label.items[0].class})"
    end
    puts '************************'
    puts
  end
end
