require 'bday_checker'

describe BdayChecker do
  let(:date_double) { double('date') }
  let(:subject) { BdayChecker.new(9,10, date_double) }
  it 'checks day and month are assigned to date' do
    expect(subject.day).to eq 9
  end

  context '#today?' do
    it 'compares day and month with current date' do
      allow(date_double).to receive(:day).and_return 9
      allow(date_double).to receive(:month).and_return 10
      expect(subject.today?).to eq true
    end
  end
end