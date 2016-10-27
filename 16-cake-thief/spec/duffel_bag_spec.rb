require 'spec_helper'

RSpec.describe DuffelBag, type: :model do
  describe "#max_duffel_bag_value method" do 
    let(:bag){ DuffelBag.new }
    
    it "returns 555 as result" do
      cake_arrays = [ [7, 160], [3, 90], [2, 15] ]
      capacity = 20
      expect(bag.max_duffel_bag_value(cake_arrays, capacity)).to eq 555
    end

    it "returns 3000 as result" do
      cake_arrays = [ [1, 30], [50, 200] ]
      capacity = 100
      expect(bag.max_duffel_bag_value(cake_arrays, capacity)).to eq 3000  
    end
    
    it "returns 120 as result" do
      cake_arrays = [ [3, 40], [5, 70] ]
      capacity = 9
      expect(bag.max_duffel_bag_value(cake_arrays, capacity)).to eq 120
    end
    
    it "returns Inifinity as result" do
      cake_arrays = [ [3, 40], [5, 70], [0, 1] ]
      capacity = 9
      expect(bag.max_duffel_bag_value(cake_arrays, capacity)).to eq Float::INFINITY
    end
    
    it "returns 120 as result (ignores cake without value and weigth)" do
      cake_arrays = [ [3, 40], [5, 70], [0, 0] ]
      capacity = 9
      expect(bag.max_duffel_bag_value(cake_arrays, capacity)).to eq 120
    end    
  end 
end