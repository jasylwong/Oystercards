require 'journeylog'

describe JourneyLog do
    describe '#start' do
        it 'responds to a start method' do
            expect(subject).to respond_to(:start)
        end
    end
    

end