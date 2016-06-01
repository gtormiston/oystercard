require_relative "journey"

class OysterCard

  MAX_BALANCE = 90 # => pounds
  MIN_BALANCE = 1 # => pounds
  MIN_CHARGE = 1 # => pounds
  PENALTY_FARE = 6

  attr_reader :balance

  def initialize(journey = Journey.new)
    @balance = 0 # => pounds
    @journey = journey
  end

  def top_up(value)
    fail("Balance limit of #{MAX_BALANCE} reached") if @balance + value > MAX_BALANCE
    @balance += value
  end


  def touch_in(station)
    fail('Balance insufficient') if @balance < MIN_BALANCE
    @journey.entry_station(station)
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    @journey.exit_station(station)
  end

  def fare
    MIN_CHARGE
  end

    private

    def deduct(value)
      @balance -= value
    end
end
