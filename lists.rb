require_relative './app'

class List
  def list_all_music_albums(array)
    if array.empty?
      puts "\n You have no music albums saved"
    else
      array.each do |album|
        puts "Date published #{album.publish_date},
      Archive status #{album.archived},
      Spotify status #{album.on_spotify}"
      end
    end
  end

  def list_all_genres(array)
    if array.empty?
      puts "\n You have no genres albums saved"
    else
      array.each do |genre|
        puts "Available Genres: #{genre.name}"
        p genre.items
      end
    end
  end
end
