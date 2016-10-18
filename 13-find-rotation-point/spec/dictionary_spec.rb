require 'spec_helper'

RSpec.describe Dictionary, type: :model do
  describe "#find_rotation_point method" do 
    let(:dict1){  
      dict1 = Dictionary.new([
                              'ptolemaic',
                              'retrograde',
                              'supplant',
                              'undulate',
                              'xenoepist',
                              'asymptote', # <-- rotates here!
                              'babka',
                              'banoffee',
                              'engender',
                              'karpatka',
                              'othellolagkage',
      ])
    }
    
    let(:dict2){  
      dict2 = Dictionary.new([
                              'xenoepist',
                              'asymptote', # <-- rotates here!
                              'babka',
                              'banoffee',
                              'engender',
                              'karpatka',
                              'othellolagkage',
                              'ptolemaic',
                              'retrograde',
                              'supplant',
                              'undulate',
      ])
    }

    let(:dict3){  
      dict3 = Dictionary.new([
                              'asymptote', # <-- rotates here!
                              'babka',
                              'banoffee',
                              'engender',
                              'karpatka',
                              'othellolagkage',
                              'ptolemaic',
                              'retrograde',
                              'supplant',
                              'undulate',
                              'xenoepist',
      ])
    }
    
    it "should return 5 as result" do
      expect(dict1.find_rotation_point).to eq 5
    end

    it "should return 1 as result" do
      expect(dict2.find_rotation_point).to eq 1
    end
    
    it "should return 0 as result" do
      expect(dict3.find_rotation_point).to eq 0
    end    
  end
end