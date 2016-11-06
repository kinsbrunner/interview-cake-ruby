require 'spec_helper'

RSpec.describe String, type: :model do
  describe "#reverse_words method" do 
    let(:string){ String.new }
    
    it "should return reversed phrase" do
      expect(string.reverse_words('Aloja')).to eq 'Aloja'
    end
    
    it "should return correct reversed string" do
      expect(string.reverse_words('This is a nice test!')).to eq 'test! nice a is This'
    end
  end

end