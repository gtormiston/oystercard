class OysterCard

  MAX_BALANCE = 90 # => pounds
  MIN_BALANCE = 1 # => pounds
  MIN_CHARGE = 1 # => pounds

  attr_reader :balance

  def initialize()
    @balance = 0 # => pounds
    @in_journey = false
  end

  def top_up(value)
    fail("Balance limit of #{MAX_BALANCE} reached") if @balance + value > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail('Balance insufficient') if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_CHARGE)
    @in_journey = false
  end

  private

  def deduct(value)
    @balance -= value
  end
end
