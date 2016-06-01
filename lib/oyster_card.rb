class OysterCard

  MAX_BALANCE = 90 # => pounds
  MIN_BALANCE = 1 # => pounds
  MIN_CHARGE = 1 # => pounds


  attr_reader :balance, :from, :journey_log, :journey


  def initialize()
    @balance = 0 # => pounds
    @journey_log = []
    @journey = {}
  end

  def top_up(value)
    fail("Balance limit of #{MAX_BALANCE} reached") if @balance + value > MAX_BALANCE
    @balance += value
  end

  def in_journey?
    journey.include?(:entry_station) && !journey.include?(:exit_station)
  end

  def touch_in(station)
    fail('Balance insufficient') if @balance < MIN_BALANCE
    journey.store(:entry_station, station)
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    journey.store(:exit_station, station)
    journey_log << journey
  end

  private

  def deduct(value)
    @balance -= value
  end
end
