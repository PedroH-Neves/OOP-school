require 'json'
require 'pry'

class Manager
  RENTALS_PATH = './store/rentals.json'.freeze
  BOOKS_PATH = './store/books.json'.freeze
  PEOPLES_PATH = './store/peoples.json'.freeze

  attr_accessor :books, :peoples, :rentals

  def initialize(data = nil)
    @data = data
  end

  def self.save_file(data)
    new(data).save_file
  end

  def save_file
    json_data.each do |item|
      file_path = "./store/#{item.keys.first}.json"
      File.write(file_path, item.values.first)
    end
  end

  def self.load_books
    obj = parsed_file(BOOKS_PATH)
    deserialize_objects(obj)
  end

  def self.load_peoples
    obj = parsed_file(PEOPLES_PATH)
    deserialize_objects(obj)
  end

  def self.load_rentals
    obj = parsed_file(RENTALS_PATH)
    deserialize_objects(obj)
  end

  def self.deserialize_objects(obj_list)
    obj_list.map { |file| Marshal.load(file) }
  end

  def self.parsed_file(path)
    json_file = File.read(path)
    JSON.parse(json_file)
  end

  def json_data
    books = create_json(@data[:books])
    peoples = create_json(@data[:peoples])
    rentals = create_json(@data[:rentals])
    [{ books: books }, { peoples: peoples }, { rentals: rentals }]
  end

  private

  def create_json(element)
    serialize_objects(element).to_json
  end

  def serialize_objects(obj_list)
    obj_list.map { |obj| Marshal.dump(obj).force_encoding('ISO-8859-1').encode('UTF-8') }
  end
end
