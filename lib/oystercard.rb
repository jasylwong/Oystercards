class Oystercard
  attr_reader :balance, :entry_station, :in_journey, :finish_station, :journeys, :journey

  MAXIMUM_BALANCE = 90  
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Balance of #{MAXIMUM_BALANCE} exceeded." if (amount + balance) > MAXIMUM_BALANCE
    @balance += amount
  end 

  def touch_in(start)
    raise "Insufficient balance to touch in" if @balance < MINIMUM_FARE
    @journey = Journey.new(start)
    @entry_station = start
  end

  def touch_out(finish)
    deduct(MINIMUM_FARE)
    @journey.exit(finish)
    @journeys += [@journey.full_journey]
    @entry_station = nil
  end

  def in_journey?
    # @journey.full_journey.length == 1
    false unless @journey
    @journey.full_journey[:b] == "Awaiting final station"
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
