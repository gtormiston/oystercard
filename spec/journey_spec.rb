require 'journey'

describe Journey do

	subject(:subject) { described_class.new }
	let(:origin_station) { double(:station) }
  let(:exit_station) { double(:station) }
  let(:oyster_card) { double :oyster_card }
  let(:journey) { {entry_station: origin_station, exit_station: exit_station}}
  let(:min_balance) { 1 }
  let(:min_charge) { 1 }

	context 'at initialisation' do

		it "#in_journey? returns false" do
      expect(subject).not_to be_in_journey
    end

		it { is_expected.to respond_to(:journey_log) }

    it 'checks that the card has an empty list of journeys' do
      expect(subject.journey_log).to eq([])
    end

	end

	context '#in_journey?' do

	end

	context 'stores journeys' do

		it 'stores the entry station' do
			subject.entry_station(origin_station)
      expect(subject.journey[:entry_station]).to eq(origin_station)
    end

    it 'stores the exit station' do
      subject.exit_station(exit_station)
      expect(subject.journey[:exit_station]).to eq(exit_station)
    end

    it 'adds the journey hash to journey_log' do
    	subject.entry_station(origin_station)
      subject.exit_station(exit_station)
      expect(subject.journey_log).to include journey
    end

	end



  context "When subject is in journey" do

      it "in_journey = true when entry_station" do
        subject.entry_station(origin_station)
        expect(subject).to be_in_journey
      end

      it "in_journey = false when exit_station" do
        subject.entry_station(origin_station)
        subject.exit_station(exit_station)
        expect(subject).not_to be_in_journey
      end

    end




end
