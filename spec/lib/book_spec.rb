require 'book'
require 'rental'
require 'pry'

describe Book do
  let(:title) { 'Dune' }
  let(:author) { 'Frank' }
  let(:instance) { described_class.new(title, author) }

  describe '.initialize' do
    it 'has the right args' do
      expect(instance.title).to eq('Dune')
      expect(instance.author).to eq('Frank')
    end

    it 'instantiate a new instance of Book class' do
      expect(instance).to be_instance_of(described_class)
    end
  end

  describe '#add_rental' do
    let(:person) { 'person' }
    let(:date) { '10' }
    let(:rental) { instance_double(Rental) }

    before do
      allow(Rental).to receive(:new).and_return(rental)
    end

    subject { instance.add_rental(person, date) }

    it 'pushes rental class to instance rental array' do
      subject

      expect(instance.rentals.empty?).to be(false)
    end

    it 'create new instance of Rental class' do
      expect(Rental).to receive(:new).with(date, instance.class, person)

      subject
    end
  end
end
