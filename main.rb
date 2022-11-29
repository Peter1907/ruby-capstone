MENU = <<~MLS
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

class Main
  def initialize
    puts 'Welcome to the Media Library'
    loop do
      puts MENU
      input = gets.chomp.to_i
      if input == 13
        puts 'Thank you for using the Media Library'
        break
      end
    end
  end
end

Main.new
