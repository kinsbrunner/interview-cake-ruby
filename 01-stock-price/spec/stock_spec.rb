require 'spec_helper'

RSpec.describe Stock, type: :model do
  describe "#get_max_profit method" do
    let(:stock){ Stock.new}

    it "should return result for cases where results come out of extreme cases" do
      expect(stock.get_max_profit([1, 2, 3, 4, 5, 6, 7, 8, 9])).to eq 8
    end    
    
    it "should return result for cases where results do not depend on extreme's values" do
      expect(stock.get_max_profit([10, 7, 5, 8, 11, 9])).to eq 6
    end
  
    it "should return minor lost in case there are no raises on the day" do
      expect(stock.get_max_profit([100, 90, 80, 70, 60, 50, 40, 30, 20, 10])).to eq -10
    end
  
    it "should trigger an error if receives less than 2 prices" do
      expect{stock.get_max_profit([55])}.to raise_error(IndexError)
    end    
    
  end
end