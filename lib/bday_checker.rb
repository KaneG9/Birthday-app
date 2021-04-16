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

  def how_long
    if @month > @today.month || (@month == @today.month && @day > @today.day)
      birthday = Date.parse("#{@today.year}-#{@month}-#{@day}")
    else
      birthday = Date.parse("#{@today.year + 1}-#{@month}-#{@day}")
    end
    (birthday - @today).to_i 
  end
end