require_relative 'balance'

class Journey
  attr_reader :entry_station, :end_station, :in_journey, :all_journeys, :balance

  MINIMUM_FARE = 1

  def initialize(balance = Balance.new)
    @entry_station
    @end_station
    @in_journey = false
    @all_journeys = {}
    @balance = balance
  end

  def start(station)
    @entry_station= station
    @in_journey= true
  end

  def finish(station)
    @end_station = station
    @all_journeys[entry_station] = end_station
    @in_journey = false

  end

  def fare
    @fare = MINIMUM_FARE
  end

  def fresh
    @entry_station= nil
    @end_station= nil
  end

end
