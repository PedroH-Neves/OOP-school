require 'json'
require 'pry'

class Manager
  def initialize(data)
    @data = data
  end

  def self.save_file(data)
    new(data).save_file
  end

  def save_file
    books = create_json_books(data[:books])
    peoples = create_json_peoples(data[:peoples])
    rentals = create_json_rentals(data[:rentals])
  end

  def create_json_books(books)
    result = []

    books.each do |book|
      result <<  
      {
        author: book.author,
        title: book.title
      }
    end
    result.to_json
  end

  def create_json_peoples(peoples)
    result = []

    peoples.each do |people|
      hash = {
        id: people.id,
        age: people.age,
        name: people.name,
        type: people.class.to_s,
        parent_permission: people.parent_permission,
      }
      hash["classroom"] = people.classroom if people.is_a?(Student)
      hash["specialization"] = people.specialization if people.is_a?(Teacher)
      hash["rentals"] = rentals?(people.rentals) ? [] : rentals(people.rentals)

      result << hash
    end
    result.to_json
  end

  def rentals?(rentals)
    rentals.empty?
  end

  def rentals(rentals)
    result = []

    rentals.each do |rental|
      result <<
      {
        date: rental.date,
        book: rental.book,
        person: rental.person.name,
      }
    end
    result       
  end

  def create_json_rentals(rentals)
    rentals(rentals).to_json
  end
end