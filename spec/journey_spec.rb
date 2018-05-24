require "journey"

describe Journey do
  let(:fake_exit_station) { double :station }
  let(:fake_entry_station) { double :station }
  let(:journey) { { fake_entry_station => fake_exit_station} }

  describe "#touch_in --> #in_journey --> #touch_out" do
    it "stores an entry station when you start a journey" do
      new_journey = Journey.new(fake_entry_station)
      expect(new_journey.entry_station).to eq fake_entry_station
    end

    it "stores the exit station" do
      new_journey = Journey.new(fake_entry_station)
      expect(new_journey.finish(fake_exit_station)).to eq fake_exit_station
    end

    it "has an empty list of journeys by default" do
      new_journey = Journey.new(fake_entry_station)
      expect(new_journey.journey_log).to eq ([])
    end

    it "a journey is created when an entry station and an exit station is provided" do
    new_journey = Journey.new(fake_entry_station)
    new_journey.finish(fake_exit_station)
    expect(new_journey.journey_log).to eq [{ fake_entry_station => fake_exit_station }]
    end

    it "stores a journey" do
      new_journey = Journey.new(fake_entry_station)
      new_journey.finish(fake_exit_station)
      expect(new_journey.journey_log).to include journey
    end
  end
end
