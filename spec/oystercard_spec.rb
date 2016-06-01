describe OysterCard do
  subject(:oyster_card) { described_class.new }
  let(:min_balance) { OysterCard::MIN_BALANCE }
  let(:min_charge) { OysterCard::MIN_CHARGE }
  let(:origin_station) { double(:station) }
  let(:exit_station) { double(:station) }
  let(:journey) { {entry_station: origin_station, exit_station: exit_station} }

  context 'At initialization' do
    it 'Has with a balance of zero' do
      expect(oyster_card.balance).to eq 0
    end
  end

  context 'In any context' do

    it { is_expected.to respond_to(:balance) }
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it { is_expected.to respond_to(:touch_out).with(1).argument }
    it { is_expected.to respond_to(:touch_in).with(1).argument }

  end

  describe 'Current journey' do

    before do
      oyster_card.top_up(OysterCard::MIN_BALANCE + 1)
      oyster_card.touch_in(origin_station)
    end


  end

  describe '#top_up' do

    it 'adds value to balance' do
      expect{ oyster_card.top_up(1) }.to change{ oyster_card.balance }.by 1
    end

    it 'raises error if balance reaches limit' do
      max_balance = OysterCard::MAX_BALANCE
      oyster_card.top_up(max_balance)
      expect{ oyster_card.top_up(1) }.to raise_error("Balance limit of #{max_balance} reached")
    end
  end

  describe '#touch_in' do
    context "When balance is insufficient" do
      it "raises an error" do
        expect{ oyster_card.touch_in(origin_station) }.to raise_error('Balance insufficient')
      end
    end
  end

  describe '#touch_out' do
    context "When oyster_card is in journey" do
      it 'charges the correct amount' do
        oyster_card.top_up(min_charge)
        oyster_card.touch_in(origin_station)
        expect{oyster_card.touch_out(exit_station)}.to change{ oyster_card.balance }.by(-min_charge)
      end
    end
  end







end
