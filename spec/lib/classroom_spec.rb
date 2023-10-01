require 'classroom'

describe Classroom do
  let(:label) { 'Microverse' }
  let(:instance) { described_class.new(label) }

  describe '.initialize' do
    it 'has the right args' do
      expect(instance.label).to eq('Microverse')
      expect(instance.classroom).to be_empty
    end
  end
end
