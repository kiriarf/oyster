class Oystercard
  CARD_LIMIT = 90
  FARE_PRICE = 1

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance is #{CARD_LIMIT}" if @balance + amount > CARD_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    in_journey
  end

  def touch_in
    raise "Insufficient balance" if @balance < FARE_PRICE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
