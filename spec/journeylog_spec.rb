require 'journeylog'

describe JourneyLog do
    let(:subject) { JourneyLog.new("journey class") }
    describe '#start' do
        it 'responds to a start method' do
            expect(subject).to respond_to(:start)
        end

        it 'starts a new journey with an entry station' do
            station_1 = Station.new("Liverpool Street", 1)
            subject.start(station_1)
            expect(subject.journey).to be_a(Journey)
            expect(subject.journey.full_journey[:a]).to eq station_1
        end

        it "ensures previous journey added if didn't tap out" do
            subject.start("Liverpool Street")
            subject.start("Bank")
            expect(subject.journeys).to eq [{ a: "Liverpool Street", b: nil }]
        end

    end

    it 'initializes with a journey_class parameter' do
        expect(subject.journey_class).to eq "journey class"
    end

    describe "#finish" do 
        it 'adds an exit station to the current_journey' do
            subject.finish("Aldgate East")
            expect(subject.journey.full_journey[:b]).to eq "Aldgate East"
        end
    end 


end