require 'nameable'

describe Nameable do
  let(:instance) {described_class.new}

  describe '#correct_name' do
    subject {instance.correct_name}

    it 'should raise error' do
      expect { subject }.to raise_error(NotImplementedError)
    end
  end
end

describe BaseDecorator do
  let(:nameable) { instance_double(Nameable) }
  let(:instance) {described_class.new(nameable)} 
  
  describe '.initialize' do
    it 'has the right args' do
      expect(instance.nameable).to eq(nameable)
    end  
  end

  describe '#correct_name' do
    before { allow(nameable).to receive(:correct_name).and_return("nameable")}

    subject {instance.correct_name}

    it 'returns the right name' do
      expect(subject).to eq("nameable")
    end
  end 
end

describe CapitalizeDecorator do
  let(:nameable) { instance_double(Nameable)}
  let(:instance) {described_class.new(nameable)}

  describe '.initialize' do
    it 'has the right args' do
      expect(instance.nameable).to eq(nameable)
    end  
  end

  describe '#correct_name' do
    before { allow(nameable).to receive(:correct_name).and_return("nameable")}

    subject {instance.correct_name}

    it 'returns the right name' do
      expect(subject).to eq("Nameable")
    end
  end
end

describe TrimmerDecorator do
  let(:nameable) { instance_double(Nameable)}
  let(:instance) {described_class.new(nameable)}

  describe '.initialize' do
    it 'has the right args' do
      expect(instance.nameable).to eq(nameable)
    end  
  end
end