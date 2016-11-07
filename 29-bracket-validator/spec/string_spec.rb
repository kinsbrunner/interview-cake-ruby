require 'spec_helper'

RSpec.describe String, type: :model do
  describe "#is_valid method" do 
    let(:string){ String.new }
    
    it "should return True" do
      code = 'Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing.'
      expect(string.is_valid(code)).to eq true
    end
    
    it "should return True" do
      code = 'Sometimes (when I nest them (my parentheticals) [too much (like this (and this))]) they {{get}} confusing.'
      expect(string.is_valid(code)).to eq true
    end
    
    it "should return False" do
      code = 'Sometimes (when I nest them (my parentheticals) [too much (like this (and this)])) they {{get}} confusing.'
      expect(string.is_valid(code)).to eq false
    end

    it "should return False" do
      code = '{ [ ( ] ) }'
      expect(string.is_valid(code)).to eq false
    end    
  end
end
