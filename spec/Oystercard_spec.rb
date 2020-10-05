require 'Oystercard'

describe Oystercard do

  let(:new_card) { Oystercard.new }

  it 'expects card balance to be 0' do
    expect(new_card.balance).to eq(0)
  end
  describe '#top_up' do
    it 'can be topped up' do
      new_card.top_up(10)
      expect(new_card.balance).to eq(10)
    end

    it 'cannot be topped up beyond the limit' do
      expect { new_card.top_up(Oystercard::CARD_LIMIT + 1) }.to raise_error("Maximum balance is #{Oystercard::CARD_LIMIT}")
    end

  end

  describe '#deduct' do
    before do
      new_card.top_up(30)
    end
    
    it 'can be reduced' do
      new_card.deduct(20)
      expect(new_card.balance).to eq(10)
    end

    # it 'cannot deduce when out of money' do
    #   expect { new_card.deduct(40) }.to raise_error("Insufficient balance")
    # end

  end

  describe '#in_journey?' do
    it 'status of journey is false by default' do
      expect(new_card.in_journey?).to eq(false)
    end

    it 'touch out changes in_journey to false' do
      new_card.touch_out
      expect(new_card.in_journey?).to eq(false)
    end

  end

  describe '#touch_in' do
    it 'changes in_journey to true' do
      new_card.top_up(10)
      new_card.touch_in
      expect(new_card.in_journey?).to eq(true)
    end

    it 'raises error if insufficient balance' do
      expect { new_card.touch_in }.to raise_error("Insufficient balance")
    end
  end

end
