require 'spec_helper'

RSpec.describe Product, type: :model do
  describe "#get_highest_product_of_3 method" do
    let(:product){ Product.new}

    it "should return expected result (1)" do
      expect(product.get_highest_product_of_3([8, 1, 2, -1, 10, 7, 2, 5])).to eq 560
    end
    
    it "should return expected result (2)" do
      expect(product.get_highest_product_of_3([8, 1, 2, -1, -10, 7, 2, 5, -10])).to eq 800
    end
    
    it "should return expected result (3)" do
      expect(product.get_highest_product_of_3([-8, -1, -2, -1, -10, -7, -2, -5, -10])).to eq -2
    end    
    
    it "should raise an Exception if less than 3 values are provided" do
      expect{product.get_highest_product_of_3([8, 1])}.to raise_error(Exception)  
    end
    
  end
end