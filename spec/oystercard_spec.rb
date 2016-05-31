describe OysterCard do
  subject(:oyster_card) { described_class.new }

  context 'At initialization' do
    it 'Has with a balance of zero' do
      expect(oyster_card.balance).to eq 0
    end

    it "#in_journey? returns false" do
      expect(oyster_card).not_to be_in_journey
    end

  end

  context 'In any context' do

    it { is_expected.to respond_to(:balance) }

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it { is_expected.to respond_to(:top_up).with(1).argument }

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

    describe '#deduct' do

      it 'deducts value from balance' do
        oyster_card.top_up(10)
        expect{ oyster_card.deduct(1) }.to change{ oyster_card.balance }.by -1
      end

      # it 'raises error if balance reaches limit' do
      #   max_balance = OysterCard::MAX_BALANCE
      #   oyster_card.top_up(max_balance)
      #   expect{ oyster_card.top_up(1) }.to raise_error("Balance limit of #{max_balance} reached")
      # end
    end
  end

  describe '#touch_in' do
    context "When oyster_card is in journey" do
      it "changes journey status to true" do
        oyster_card.touch_in
        expect(oyster_card).to be_in_journey
      end


    end
    # context "When oyster_card is not in journey" do
    #   it "raises an error"do
    #
    #   end
    # end

    describe '#touch_out' do
      context "When oyster_card is in journey" do
        it "changes journey status to false" do
          oyster_card.touch_in
          oyster_card.touch_out
          expect(oyster_card).not_to be_in_journey
        end
      end
    end






  end















end
