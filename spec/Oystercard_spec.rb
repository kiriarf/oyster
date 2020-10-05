require 'Oystercard'

describe Oystercard do

  let(:new_card) {Oystercard.new}

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
    it 'can be reduced' do
      new_card.top_up(30)
      new_card.deduct(20)
      expect(new_card.balance).to eq(10)
    end
  end

  describe '#journey' do
    it 'status of passanger is false by default' do
      expect(new_card.in_journey?).to eq(false)
    end
  end

end
