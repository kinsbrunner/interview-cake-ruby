require 'spec_helper'

RSpec.describe Change, type: :model do
  describe "#num_ways method" do
    let(:change){ Change.new}

    it "should return expected result (1)" do
      expect(change.num_ways(4, [1, 2, 3])).to eq 4
    end

    it "should return expected result (2)" do
      expect(change.num_ways(6, [1, 2, 3])).to eq 7
    end

    it "should return expected result (3)" do
      expect(change.num_ways(5, [1, 3, 5])).to eq 3
    end    
  end
end