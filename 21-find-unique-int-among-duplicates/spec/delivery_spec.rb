require 'spec_helper'

RSpec.describe Delivery, type: :model do
  describe "#find_unique_delivery_id method" do 
    let(:delivery){ delivery = Delivery.new }

    it "should return 123 as result" do
      expect(delivery.find_unique_delivery_id([1, 2, 3, 123, 4, 5, 1, 2, 3, 4, 5])).to eq 123
    end
    
    it "should return 0 as result" do
      expect(delivery.find_unique_delivery_id([1, 2, 3, 4, 5, 1, 2, 3, 4, 5])).to eq 0
    end
    
    it "should return 1 as result" do
      expect(delivery.find_unique_delivery_id([1])).to eq 1
    end    
  end 
end