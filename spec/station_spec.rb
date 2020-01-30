require 'station'

describe Station do
  let(:subject) { Station.new("Bethnal Green", 2) }

  it 'knows its name' do
      expect(subject.name).to eq "Bethnal Green"
  end

  describe '#zone' do
    it 'returns the zone number' do
        expect(subject.zone).to eq 2
    end
  end
end