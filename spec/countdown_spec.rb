require_relative '../countdown'

describe Countdown do

  describe "New Countdown" do

    let (:countdown) { Countdown.new }

    it "should have target" do
      expect(countdown.target).to be_between(100, 999) 
    end

    it "should generate set of numbers" do
      expect(countdown.numbers.length).to eq 6
    end

    it "find combination" do
      puts countdown.target
      countdown.find_combination
      expect(countdown.find_combination).to eq countdown.target
    end

  end

end