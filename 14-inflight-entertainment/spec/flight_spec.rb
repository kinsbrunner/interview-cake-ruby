require 'spec_helper'

RSpec.describe Flight, type: :model do
  describe "#can_two_movies_fill_flight method" do 
    let(:flight){ Flight.new(90) }
    
    
    it "should return True as result" do
      expect(flight.can_two_movies_fill_flight([10, 30, 40, 50, 20, 90, 80, 70])).to eq true
    end

    it "should return True as result" do
      expect(flight.can_two_movies_fill_flight([90, 90, 60, 45, 45])).to eq true
    end
    
    it "should return True as result" do
      expect(flight.can_two_movies_fill_flight([90, 90, 60, 45, 30])).to eq true
    end
      
    it "should return False as result" do
      expect(flight.can_two_movies_fill_flight([100, 30, 400, 50, 200, 90, 80, 70])).to eq false
    end    
  end
end