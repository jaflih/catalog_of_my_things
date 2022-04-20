require './console/app'
require './console/utilities'

# rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
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
    when '7'
      app.list_games
    when '8'
      app.create_game
    when '9'
      app.list_authors
    when '0'
      puts "\n"
      puts 'Exited successfully, thank you for using this app 👍😊💪'
      app.save
    else
      puts 'Wrong input'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength

main
