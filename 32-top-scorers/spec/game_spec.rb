require 'spec_helper'

RSpec.describe Game, type: :model do 
  describe "#sort_scores method" do 
    let(:game){ Game.new }
    HIGHEST_POSSIBLE_SCORE = 100
    
    it "should return sorted scores" do
      unsorted_scores = [37, 89, 41, 65, 91, 53]
      result = [37, 41, 53, 65, 89, 91]
      expect(game.sort_scores(unsorted_scores, HIGHEST_POSSIBLE_SCORE)).to eq result
    end
    
    it "should return sorted scores even if many people have same points" do
      unsorted_scores = [37, 89, 89, 41, 65, 89, 91, 53, 41]
      result = [37, 41, 41, 53, 65, 89, 89, 89, 91]
      expect(game.sort_scores(unsorted_scores, HIGHEST_POSSIBLE_SCORE)).to eq result
    end
  end    
end
