require 'spec_helper'

RSpec.describe Product, type: :model do
  describe "#get_max_profit method" do
    let(:product){ Product.new}

    it "should return expected result (1)" do
      expect(product.productOfAllNums([1, 7, 3, 4])).to eq([84, 12, 28, 21])
    end
    
    it "should return expected result (2)" do
      expect(product.productOfAllNums([1, 2, 6, 5, 9])).to eq([540, 270, 90, 108, 60])
    end

    it "should return an empty array when receiving an empty array" do
      expect(product.productOfAllNums([])).to eq([])
    end
    
    it "should return an array[1] when receiving a one-element array" do
      expect(product.productOfAllNums([1234])).to eq([1])
    end
  end
end