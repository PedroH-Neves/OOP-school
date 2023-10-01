require 'student'

describe Student do
  let(:age) { '16' }
  let(:classroom) { '7' }
  let(:name) { 'peter' }
  let(:parent_permission) { false }
  let(:instance) { described_class.new(age, classroom, name, parent_permission)}

  describe '.initialize' do
    it 'has the right args' do
      expect(instance.age).to eq('16')
      expect(instance.classroom).to eq('7')
      expect(instance.name).to eq('peter')
      expect(instance.parent_permission).to eq(false)
    end
  end
  
  describe '#play_hooky' do
    it 'returns a happy face' do
      expect(instance.play_hooky).to eq('¯\(ツ)/¯') 
    end
  end  
end