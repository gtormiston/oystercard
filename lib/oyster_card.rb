class OysterCard

  MAX_BALANCE = 90 # => pounds
  MIN_BALANCE = 1 # => pounds
  MIN_CHARGE = 1 # => pounds


  attr_reader :balance, :from


  def initialize()
    @balance = 0 # => pounds
    @from = nil
  end

  def top_up(value)
    fail("Balance limit of #{MAX_BALANCE} reached") if @balance + value > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    !!@from
  end

  def touch_in(station)
    fail('Balance insufficient') if @balance < MIN_BALANCE
    @from = station
  end

  def touch_out
    deduct(MIN_CHARGE)
    @from = nil
  end

  private

  def deduct(value)
    @balance -= value
  end
end
