require 'spec_helper'

RSpec.describe Selling, type: :model do 
  describe "#merge_orders method" do 
    let(:selling){ Selling.new }
    
    it "should return [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]" do
      expect(selling.merge_orders([3, 4, 6, 10, 11, 15], [1, 5, 8, 12, 14, 19])).to eq [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
    end

    it "should return [1, 2, 3, 4, 5, 6, 7, 8, 12, 14, 19]" do
      expect(selling.merge_orders([1, 2, 3, 4, 5, 6], [7, 8, 12, 14, 19])).to eq [1, 2, 3, 4, 5, 6, 7, 8, 12, 14, 19]
    end

    it "should return [1, 2, 3, 4, 5, 6]" do
      expect(selling.merge_orders([1, 2, 3, 4, 5, 6], [])).to eq [1, 2, 3, 4, 5, 6]
    end

    it "should return [1, 5, 8, 12, 14, 19]" do
      expect(selling.merge_orders([], [1, 5, 8, 12, 14, 19])).to eq [1, 5, 8, 12, 14, 19]
    end
  end    
end
