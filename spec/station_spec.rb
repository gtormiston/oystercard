require "station"

describe Station do

	let(:name) {double :name}
	let(:zone) {double :zone}
	subject { described_class.new(name,zone) }

	it "allows to pass in a name" do
		expect(subject.name).to eq name
	end

	it "allows to pass in a zone" do
		expect(subject.zone).to eq zone
	end

end
