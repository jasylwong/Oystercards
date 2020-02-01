require './lib/journeylog.rb'

class Oystercard
  attr_reader :balance, :entry_station, :in_journey, :journey_log

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
    if !@journey_log.journey.nil?
      deduct(@journey_log.journey.fare) if !@journey_log.journey.entry_station.nil? && @journey_log.journey.exit_station.nil?
    end
    @journey_log.start(start)
    @entry_station = start
  end

  def touch_out(finish)
    @journey_log.finish(finish)
    deduct(@journey_log.journey.fare)
    @entry_station = nil
  end

  def in_journey?
    @journey_log.journey.in_journey?
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
