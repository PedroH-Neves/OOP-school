require './app'
require './display'
require './display_option'

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
    puts 'Good bye!'
  end
end

main = Main.new
main.run
