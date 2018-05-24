class OysterCard

  STARTING_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_accessor :balance
  attr_reader :entry_station, :exit_station, :journey_log

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @journey_log = []
  end

  def top_up(amount)
    raise "Maximum balance exceeded!" if (amount + @balance) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Not enough money on card" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def in_journey?
    @entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    @journey_log << {@entry_station => @exit_station}
    @entry_station = nil
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
