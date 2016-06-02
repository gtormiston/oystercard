require 'balance'

describe Balance do
  subject(:balance) { described_class.new}
  
  context 'responses' do
    it { is_expected.to respond_to :current }
    it { is_expected.to respond_to :add }
  end

  describe '#add' do
    it 'adds 10 to the card' do
      expect{ balance.add(10) }.to change{ balance.current }.by(10)
    end

    it 'raises an error when a non valid object is input' do
      expect{ balance.add("foo") }.to raise_error("Invalid input")
    end

    it 'raises an error when exceeding limit' do
      
    end
  end
end
