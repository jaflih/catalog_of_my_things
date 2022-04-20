require_relative './console/app'
require_relative './console/utilities'

def main()
  app = App.new
  util = Util.new
  option = nil
  app.load_book
  while option != '0'
    util.menu_display
    option = gets.chomp
    case option
    when '1'
      app.list_all_books
    when '2'
      app.add_a_book
    when '3'
      app.list_all_labels
    when '0'
      puts "\n"
      puts 'Exited successfully, thank you for using this app 👍😊💪'
      app.save_book
    else
      puts 'Wrong input'
    end
  end
end

main
