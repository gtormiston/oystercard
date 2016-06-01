class Journey

	attr_reader :journey_log, :journey

	def initialize
		@in_journey = false
		@journey_log = []
		@journey = {}
	end

	def in_journey?
		@in_journey
	end

	def entry_station(station)
		@journey = {}
		journey.store(:entry_station, station)
		@in_journey = true
	end

	def exit_station(station)
		journey.store(:exit_station, station)
		journey_log << journey
		@in_journey = false
	end

end
