describe OysterCard do
  subject(:oyster_card) { described_class.new }

  context 'At initialization' do
    it 'Has with a balance of zero' do
      expect(oyster_card.balance).to eq 0
    end
  end

  context 'In any context' do

    it { is_expected.to respond_to(:balance) }

    it { is_expected.to respond_to(:top_up).with(1).argument }

    describe '#top_up' do
 
      it 'adds value to balance' do
        expect{ oyster_card.top_up(1) }.to change{ oyster_card.balance }.by 1
      end

      it 'raises error if balance reaches limit' do
        oyster_card.top_up(OysterCard::MAX_BALANCE)
        expect{ oyster_card.top_up(1) }.to raise_error('Balance limit reached!') 
      end
    end
  end 

end
