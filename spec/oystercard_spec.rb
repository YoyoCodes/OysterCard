require "oystercard"

describe OysterCard do
  subject(:card) { OysterCard.new }

  it "has a balance of zero" do
    expect(card.balance).to eq (0)
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds money to a card" do
      expect{ card.top_up(10) }.to change{ card.balance }.by 10
    end

    it "has a top up limit" do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect { card.top_up(1)}.to raise_error "Maximum balance exceeded!"
    end
  end
end
