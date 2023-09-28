def handle_options(option)
  case option
  when 1
    @app.list_of_books
  when 2
    @app.list_of_people
  when 3
    @app.create_person
  when 4
    @app.create_book
  when 5
    @app.create_rental
  when 6
    @app.list_rentals_for_person
  else
    puts 'Invalid option'
  end
end
