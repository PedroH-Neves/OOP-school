require 'person'
require 'rental'

describe Person do 
  let(:age) { '12' }
  let(:name) { 'John Doe' }
  let(:instance) {described_class.new(age, name)}

  describe '.initialize' do
    it 'has the right args' do
      expect(instance.id).to be_a(Integer)
      expect(instance.age).to eq('12')
      expect(instance.name).to eq('John Doe')
      expect(instance.parent_permission).to eq(true)
      expect(instance.rentals).to eq([])
    end
  end
  
  describe '#add_rental' do
    let(:book) { 'frankstein' }
    let(:date) { '10' }
    let(:rental) { instance_double(Rental) }

    before do
      allow(Rental).to receive(:new).and_return(rental)
    end

    subject { instance.add_rental(book, date) }

    it 'pushes rental class to instance rental array' do
      subject

      expect(instance.rentals.empty?).to be(false)
    end

    it 'create new instance of Rental class' do
      expect(Rental).to receive(:new).with(book, date, instance.class)
      
      subject
    end
  end

  describe '#correct_name' do
    subject { instance.correct_name }

    it 'it returns the atribute name' do
      expect(subject).to eq('John Doe')
    end
  end

  describe '#of_age?' do
    context 'above age' do
      let(:age) { '21' }
      let(:instance) {described_class.new(age, name)}

      subject { instance.of_age? }

      it 'returns true' do
        expect(subject).to eq(true) 
      end
    end
    context 'below age' do
      subject { instance.of_age? }

      it 'returns false' do
        expect(subject).to eq(false)
      end
    end    
  end
end
