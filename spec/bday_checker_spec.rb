require 'bday_checker'

describe BdayChecker do
  let(:same_date_double) { double('date', :day => 9, :month => 10, :year => 2021) }
  #let(:different_date_double) { double('date', :day => 31, :month => 3, :year => 2021) }
  let(:same_date_subject) { BdayChecker.new(9, 10, same_date_double) }
  let(:diff_date_subject) { BdayChecker.new(9, 10, Date.new(2021,3,31)) }
  it 'checks day and month are assigned to date' do
    expect(same_date_subject.day).to eq 9
  end

  context '#today?' do
    it 'compares day and month with current date' do
      expect(same_date_subject.today?).to eq true
    end
  end

  context '#how_long' do
    it 'works out how many days between today and birthday (same year)' do
      expect(diff_date_subject.how_long).to eq 192
    end

    it 'works out how many days between today and birthday (diff year)' do
      expect(BdayChecker.new(9, 10, Date.new(2021,10,10)).how_long).to eq 364
    end
  end
end