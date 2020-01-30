require 'journey'

describe Journey do
    let(:entry_station) { double :station }
    let(:exit_station) { double :station }
    let(:subject) { Journey.new(entry_station) }


    describe "#initialize" do
        it 'records the entry station' do
            expect(subject.entry_station).to eq entry_station
        end
    end

    describe "#exit_station" do
        it 'records the exit station' do
            expect(subject.exit(exit_station)).to eq exit_station
        end
    end

    describe "#full_journey" do
        it 'records the full journey' do
            subject.exit(exit_station)
            expect(subject.full_journey).to eq( {:a => entry_station, :b => exit_station} )
        end
    end
end