require_relative 'journey'

class Oystercard
  attr_reader :current_balance, :entry_station, :journey

  def initialize(journey= Journey.new)
    @journey = journey
    @balance = journey.balance
    @current_balance = balance.current
  end

  def top_up(value)
    balance.add(value)
  end
  
  def touch_in(entry)
    #fail "Insufficient funds" if @balance < MINIMUM_FARE
    journey.start(entry)
  end

  def touch_out(finish)
    journey.finish(finish)
    #value = journey.fare
    #deduct(value)
    #journey.fresh
  end

    private

    attr_reader :balance

    #MINIMUM_FARE = 1

    # def deduct(value)
    #   deduct_fail(value)
    #   @balance -= value
    # end
    
    # def deduct_fail(value)
    #   fail "Please input an integer" unless is_number?(value)
    #   fail "Insufficient funds" if empty?(value)
    # end
end
