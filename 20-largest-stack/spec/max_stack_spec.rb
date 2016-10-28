require 'spec_helper'

RSpec.describe MaxStack, type: :model do
  describe "#get_max method" do 
    let(:stack){ 
      stack = MaxStack.new 
      stack.push(3)
      stack.push(7)
      stack.push(5)
      stack.push(6)
      stack.push(8)
      return stack
    }
    
    it "should return 8 as result" do
      expect(stack.get_max).to eq 8
    end

    it "should return 7 as result" do
      stack.pop
      expect(stack.get_max).to eq 7
    end
    
    it "should return 9 as result" do
      stack.push(9)
      expect(stack.get_max).to eq 9
    end
    
    it "should return 3 as result" do
      4.times do
        stack.pop
      end
      stack.push(2)
      expect(stack.get_max).to eq 3
    end
    
    it "should return nil as result" do
      5.times do
        stack.pop
      end
      expect(stack.get_max).to be_nil
    end    
  end 
end