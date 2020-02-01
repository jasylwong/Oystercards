require 'journey'

describe Journey do
    let(:entry_station) { double :station, zone: 1 }
    let(:exit_station) { double :station, zone: 3 }
    let(:subject) { Journey.new }

    describe "#exit_station" do
        it 'records the exit station' do
            expect(subject.exit(exit_station)).to eq exit_station
        end

        it 'sets the fare to the actual journey fare if entered AND exited' do
            subject.enter(entry_station)
            subject.exit(exit_station)
            expect(subject.fare).to eq (entry_station.zone - exit_station.zone).abs + Journey::BASIC_FARE
        end

        it 'keeps the penalty fare if you did not exit' do
            subject.enter(entry_station)
            expect(subject.fare).to eq described_class::PENALTY_FARE
        end

        it 'keeps the penalty fare if you did not enter' do
            subject.exit(exit_station)
            expect(subject.fare).to eq described_class::PENALTY_FARE
        end
    end

    describe "#full_journey" do
        it 'records the full journey' do
            subject.enter(entry_station)
            subject.exit(exit_station)
            expect(subject.full_journey).to eq( {:a => entry_station, :b => exit_station} )
        end

        it "returns nil upon no entry or exits" do
            expect(subject.full_journey).to eq ( {:a => nil, :b => nil} )
            subject.enter(entry_station)
            expect(subject.full_journey).to eq ( {:a => entry_station, :b => nil} )
        end
    end

    describe "#in_journey?" do
        it 'is not in journey at the end' do
            subject.exit(exit_station)
            expect(subject).to_not be_in_journey
        end

        it 'is in journey before it reaches exit station' do
            subject.enter(entry_station)
            expect(subject).to be_in_journey
        end
    end

    describe "#fare" do
        let(:station1) { double :station, zone: 1 }
        let(:station2) { double :station, zone: 1 }
        let(:station3) { double :station, zone: 3 }
        let(:station4) { double :station, zone: 6 }

        it 'sets the penalty fare by default' do
            expect(subject.fare).to eq described_class::PENALTY_FARE
        end

        it 'sets the fare at the basic rate for journeys in the same zone' do
            subject.enter(station1)
            subject.exit(station2)
            expect(subject.fare).to eq described_class::BASIC_FARE
        end

        it 'sets the fare for journeys in different zones' do
            subject.enter(station3)
            subject.exit(station4)
            expect(subject.fare).to eq (station3.zone - station4.zone).abs + Journey::BASIC_FARE
        end
    end
end