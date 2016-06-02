require_relative 'balance'

class Journey
  attr_reader :entry_station, :end_station, :in_journey, :all_journeys, :balance, :fare

  def initialize(balance = Balance.new)
    @in_journey = false
    @all_journeys = []
    @balance = balance
    @fare = MINIMUM_FARE
  end

  def start(station)
    penalty_start if in_journey
    @entry_station= station
    @in_journey= true
  end

  def finish(station)
    penalty_end unless in_journey
    @end_station = station
    payment
    journey
    fresh
  end


    private
    
    MINIMUM_FARE = 1
    PENALTY_FARE = 6
    def journey
      @all_journeys.push({entry_station => end_station})
    end
    
    def payment
      balance.deduct(fare)
    end

    def fresh
      @entry_station= nil
      @end_station= nil
      @in_journey = false
    end

    def penalty_fare 
      balance.deduct(PENALTY_FARE)
      fail "Penalty fare has been charged, try again"
    end

    def penalty_start
      @in_journey = false
      penalty_fare
    end

    def penalty_end
      @in_journey = true
      penalty_fare
    end


end
