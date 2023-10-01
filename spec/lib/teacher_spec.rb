require 'teacher'

describe Teacher do
  let(:age) { '400' }
  let(:name) { 'Dumbledore' }
  let(:specialization) { 'sel-defense magic' }
  let(:instance) { described_class.new(age, name, specialization)}
  
  describe '.initialize' do
    it 'has the right args' do
      expect(instance.age).to eq('400')
      expect(instance.name).to eq('Dumbledore')
      expect(instance.specialization).to eq('sel-defense magic')
    end  
  end
  
  describe '#can_use_services?' do
    it 'has to be true' do
      expect(instance.can_use_services?).to eq(true)
    end
  end
end