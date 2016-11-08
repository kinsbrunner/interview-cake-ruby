require 'spec_helper'

RSpec.describe String, type: :model do
  describe "#has_palindrome_permutation method" do 
    let(:string){ String.new }
    
    it "should return True" do
      expect(string.has_palindrome_permutation('aabbcc')).to eq true
    end
    
    it "should return True" do
      expect(string.has_palindrome_permutation('ajabbcc')).to eq true
    end
    
    it "should return True" do
      expect(string.has_palindrome_permutation('civic')).to eq true
    end
    
    it "should return True" do
      expect(string.has_palindrome_permutation('civicv')).to eq true
    end

    it "should return False" do
      expect(string.has_palindrome_permutation('civicvfd')).to eq false
    end

    it "should return False" do
      expect(string.has_palindrome_permutation('abcd')).to eq false
    end

    it "should return False" do
      expect(string.has_palindrome_permutation('abcdcd')).to eq false
    end
  end
end
