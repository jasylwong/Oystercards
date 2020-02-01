require './lib/journeylog.rb'

class Oystercard
  attr_reader :balance, :entry_station, :in_journey, :finish_station, :journey_log, :journey

  MAXIMUM_BALANCE = 90  
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Balance of #{MAXIMUM_BALANCE} exceeded." if (amount + balance) > MAXIMUM_BALANCE
    @balance += amount
  end 

  def touch_in(start)
    raise "Insufficient balance to touch in" if @balance < MINIMUM_FARE
    @journey = Journey.new
    @journey.enter(start)
    @journey_log.start(start)
    @entry_station = start
  end

  def touch_out(finish)
    # p @journey_log.journeys
    @journey = Journey.new unless @journey
    deduct(MINIMUM_FARE)
    @journey.exit(finish)
    @journey_log.finish(finish); @entry_station = nil
    # p @journey_log.journeys
  end

  def in_journey?
    return false unless @journey
    @journey.in_journey?
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
