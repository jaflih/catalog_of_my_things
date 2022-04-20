require './app'
require './console/utilities'

def main()
  app = App.new
  util = Util.new
  option = nil
  while option != '0'
    util.menu_display
    option = gets.chomp
    case option
    when '1'
      app.create_book
    when '2'
      app.list_books
    when '0'
      puts "\n"
      puts 'Exited successfully, thank you for using this app 👍😊💪'
    else
      puts 'Wrong input'
    end
  end
end

main
