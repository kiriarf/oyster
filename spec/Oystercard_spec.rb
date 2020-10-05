require 'Oystercard'

describe Oystercard do

  let(:new_card) {Oystercard.new}

  it 'expects card balance to be 0' do
    expect(new_card.balance).to eq(0)
  end

end
