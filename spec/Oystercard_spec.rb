require 'Oystercard'

describe Oystercard do

  let(:new_card) {Oystercard.new}

  it 'expects card balance to be 0' do
    expect(new_card.balance).to eq(0)
  end

  it 'can be topped up' do
    new_card.top_up(10)
    expect(new_card.balance).to eq(10)
  end

end
