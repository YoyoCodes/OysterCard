class Journey
  attr_reader :entry_station, :journey_log

  def initialize(entry_station)
    @entry_station = entry_station
    @journey_log = []
  end

  def finish(exit_station)
    @journey_log << { @entry_station => exit_station }
    @exit_station = exit_station
  end

end
