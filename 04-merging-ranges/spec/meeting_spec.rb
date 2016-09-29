require 'spec_helper'

RSpec.describe Meeting, type: :model do
  describe "#condense_meeting_times method" do
    let(:meeting){ Meeting.new}

    it "should return expected result (1)" do
      expect(meeting.condense_meeting_times([ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ])).to eq([ [0, 1], [3, 8], [9, 12] ])
    end
    
    it "should return expected result (2)" do
      expect(meeting.condense_meeting_times([ [1, 2], [2, 3] ])).to eq([ [1, 3] ])
    end
    
    it "should return expected result (3)" do
      expect(meeting.condense_meeting_times([ [1, 5], [2, 3] ])).to eq([ [1, 5] ])
    end    

    it "should return expected result (4)" do
      expect(meeting.condense_meeting_times([ [1, 10], [2, 6], [3, 5], [7, 9] ])).to eq([ [1, 10] ])
    end   
 
    it "should return expected result (5)" do
      expect(meeting.condense_meeting_times([ [1, 3], [2, 4] ])).to eq([ [1, 4] ])
    end    

    it "should return expected result (6)" do
      expect(meeting.condense_meeting_times([ [1, 3], [2, 4], [4, 8] ])).to eq([ [1, 8] ])
    end       
    
  end
end