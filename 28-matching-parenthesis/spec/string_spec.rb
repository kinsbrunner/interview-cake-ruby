require 'spec_helper'

RSpec.describe String, type: :model do
  describe "#get_closing_parenthesis method" do 
    let(:string){ String.new }
    let(:sentence){ 'The important lines (Hello (said John), my dear friend (referring to Tony))' }
    
    it "should return the expected answer(79)" do
      example = 'Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing.'
      expect(string.get_closing_parenthesis(example, 10)).to eq 79
    end

    it "should return the expected answer(74)" do
      expect(string.get_closing_parenthesis(sentence, 20)).to eq 74
    end
    
    it "should return the expected answer(37)" do
      expect(string.get_closing_parenthesis(sentence, 27)).to eq 37
    end
    
    it "should throw an exception as there is no answer" do
      sentence[74] = 'x' #Replaccing last closing parenthesis by any other character
      expect{string.get_closing_parenthesis(sentence, 20)}.to raise_error(Exception)
    end
  end
end
