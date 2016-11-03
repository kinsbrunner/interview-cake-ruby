require 'spec_helper'

RSpec.describe String, type: :model do
  describe "#reverse method" do 
    let(:string){ String.new }
    
    it "should return ajolA" do
      expect(string.reverse('Aloja')).to eq 'ajolA'
    end
    
    it "should return correct reversed string" do
      expect(string.reverse('This is a nice test!')).to eq '!tset ecin a si sihT'
    end
  end

end