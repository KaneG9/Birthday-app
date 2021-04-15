class BdayChecker
  attr_reader :day, :month

  def initialize(day, month, today = Date.today)
    @day = day
    @month = month
    @today = today
  end

  def today?
    @day == @today.day && @month == @today.month
  end

end