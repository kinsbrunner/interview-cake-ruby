require 'spec_helper'

RSpec.describe Fibber, type: :model do
  describe "#fibonacci method" do 
    let(:fibber){ Fibber.new }
    
    it "should return Fib(3) = 2" do
      expect(fibber.fibonacci(3)).to eq 2
    end
    
    it "should return Fib(10) = 55" do
      expect(fibber.fibonacci(10)).to eq 55
    end
    
    it "should return Fib(15) = 610" do
      expect(fibber.fibonacci(15)).to eq 610
    end
  end
  
  describe "#fib_iterative method" do 
    let(:fibber){ Fibber.new }
    
    it "should return Fib(3) = 2" do
      expect(fibber.fib_iterative(3)).to eq 2
    end
    
    it "should return Fib(10) = 55" do
      expect(fibber.fib_iterative(10)).to eq 55
    end
    
    it "should return Fib(15) = 610" do
      expect(fibber.fib_iterative(15)).to eq 610
    end
  end  
end