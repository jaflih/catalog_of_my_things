require './console/app'
require './utilities'

def main()
  app = App.new
  util = Util.new
  option = nil
  while option != '0'
    util.menu_display
    option = gets.chomp
    case option
    when '1'
      app.list_books
    when '2'
      app.create_book
    when '4'
      app.list_music_albums
    when '5'
      app.list_genres
    when '6'
      app.add_music_album
    when '0'
      puts "\n"
      puts 'Exited successfully, thank you for using this app 👍😊💪'
      app.save_music_album
    else
      puts 'Wrong input'
    end
  end
end

main
