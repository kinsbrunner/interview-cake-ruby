require 'spec_helper'

RSpec.describe WordCloudData, type: :model do 
  describe "#populate_words_to_counts method" do 

    it "should return expected result (1)" do
      results = {"After" => 1, "beating" => 1, "the" => 2, "eggs" => 1, "Dana" => 1, "read" => 1, "next" => 1, "step"=> 1}
      wcd = WordCloudData.new("After beating the eggs, Dana read the next step:")
      expect(wcd.words_to_counts).to eq results
    end

    it "should return expected result (2)" do
      results = {"add" => 2, "milk" => 1, "and" => 2, "eggs" => 1, "then" => 1, "flour" => 1, "sugar"=> 1}
      wcd = WordCloudData.new("Add milk and eggs, then add flour and sugar.")
      expect(wcd.words_to_counts).to eq results
    end

    it "should return expected result (3)" do
      results = {"we" => 4, "came" => 1, "saw" => 1, "conquered" => 1, "then" => 1, "ate" => 1, "Bill's" => 1, "Mille-Feuille"=> 1, "cake" => 1}
      wcd = WordCloudData.new("We came, we saw, we conquered...then we ate Bill's (Mille-Feuille) cake.")
      expect(wcd.words_to_counts).to eq results
    end

    it "should return expected result (4)" do
      results = {"we" => 3, "came" => 1, "saw" => 1, "ate" => 1, "cake" => 1}
      wcd = WordCloudData.new("We came, we saw ; we ate cake. ")
      expect(wcd.words_to_counts).to eq results
    end

    it "should return expected result (5)" do
      results = {"Friends" => 1, "Romans" => 1, "countrymen" => 1, "Let" => 1, "us" => 1, "eat" => 1, "cake"=> 1}
      wcd = WordCloudData.new("Friends, Romans, countrymen! Let us eat cake...")
      expect(wcd.words_to_counts).to eq results
    end

    it "should return expected result (6)" do
      results = {"New" => 2, "tourists" => 1, "in" => 2, "York" => 1, "often" => 1, "wait" => 1, "long" => 1, "lines"=> 1, "for"=> 1, "cronuts"=> 1}
      wcd = WordCloudData.new("New tourists in New York often wait in long lines for cronuts.")
      expect(wcd.words_to_counts).to eq results
    end

    it "should return expected result (7)" do
      results = {"Cliff" => 1, "finished" => 1, "his" => 1, "cake" => 1, "and" => 1, "paid" => 1, "the" => 1, "bill"=> 1}
      wcd = WordCloudData.new("Cliff finished his cake and paid the bill.")
      expect(wcd.words_to_counts).to eq results
    end

    it "should return expected result (8)" do
      results = {"Bill" => 1, "finished" => 1, "his" => 1, "cake" => 1, "at" => 1, "the" => 2, "edge" => 1, "of" => 1, "cliff"=> 1}
      wcd = WordCloudData.new("Bill finished his cake at the edge of the cliff.")
      expect(wcd.words_to_counts).to eq results
    end
    
    it "should return expected result (9)" do
      results = {"cliff" => 2, "finished" => 2, "his" => 2, "cake" => 2, "and" => 1, "paid" => 1, "the" => 3, "bill"=> 2, "at" => 1, "edge" => 1, "of" => 1}
      wcd = WordCloudData.new("Cliff finished his cake and paid the bill. Bill finished his cake at the edge of the cliff.")
      expect(wcd.words_to_counts).to eq results
    end
  end    
end
