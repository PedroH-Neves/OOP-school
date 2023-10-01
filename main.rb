require './lib/app'
require './lib/display'
require './lib/display_option'
require './data/manager'
require 'pry'

class Main
  def initialize
    @app = App.new
  end

  def run
    display_options

    while (option = gets.chomp.to_i) != 7
      handle_options(option)
      puts ''
      display_options
    end

    to_be_saved = {
      books: @app.books,
      peoples: @app.peoples,
      rentals: @app.rentals
    }

    Manager.save_file(to_be_saved)

    puts 'Good bye!'
  end
end

main = Main.new
main.run
