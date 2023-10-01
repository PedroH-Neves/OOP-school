require 'rental'
require 'book'
require 'person'

describe Rental do
  let(:date) { '07-01-2002' }
  let(:book) { Book.new('Dune', 'Frank Herbert') }
  let(:person) { Person.new('18', 'John') }
  let(:instance) { described_class.new(date, book, person) }

  describe '.initialize' do
    it 'has the right args' do
      expect(instance.date).to eq('07-01-2002')
      expect(instance.book).to be_instance_of(Book)
      expect(instance.person).to be_instance_of(Person)
    end

    it 'adds self to other classes' do
      expect(book.rentals).to eq([instance])
      expect(person.rentals).to eq([instance])
    end
  end
end
