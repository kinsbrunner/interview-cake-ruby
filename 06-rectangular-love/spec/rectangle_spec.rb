require 'spec_helper'

RSpec.describe Rectangle, type: :model do
  describe "#find_range_overlap method" do
    let(:rectangle){ Rectangle.new}
    let(:rect1) {
      rect1 = {
        'left_x'   => 0,
        'bottom_y' => 0,
        'width'    => 10,
        'height'   => 5
      }
    }
    let(:nil_result) {
      nil_result = {  
        'left_x'   => nil,
        'bottom_y' => nil,
        'width'    => nil,
        'height'   => nil
      }
    }
   
    it "should work for rectangles that intersect on a piece of each" do  
      rect2 = {
        'left_x'   => 8,
        'bottom_y' => 4,
        'width'    => 6,
        'height'   => 3
      }
      
      expected_result = {
        'left_x'   => 8,
        'bottom_y' => 4,
        'width'    => 2,
        'height'   => 1
      }
      
      expect(rectangle.find_overlap(rect1, rect2)).to eq(expected_result)
    end

    it "should work for rectangles that are contained one inside the other" do
      rect2 = {
        'left_x'   => 2,
        'bottom_y' => 1,
        'width'    => 6,
        'height'   => 3
      }
      
      expect(rectangle.find_overlap(rect1, rect2)).to eq(rect2)
    end
  
    it "should work for rectangles that do not intersect (return nil)" do
      rect2 = {
        'left_x'   => 12,
        'bottom_y' => 6,
        'width'    => 4,
        'height'   => 4
      }
      
      expect(rectangle.find_overlap(rect1, rect2)).to eq(nil_result)
    end
  
    it "should work for rectangles that just 'touch' each other (return nil)" do
      rect2 = {
        'left_x'   => 10,
        'bottom_y' => 4,
        'width'    => 4,
        'height'   => 4
      }
      
      expect(rectangle.find_overlap(rect1, rect2)).to eq(nil_result)
    end
  end
end