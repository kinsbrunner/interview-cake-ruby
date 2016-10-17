require 'spec_helper'

RSpec.describe BinaryTreeNode, type: :model do
  describe "#get_second_largest method" do
    let(:btree1){ 
      root = BinaryTreeNode.new(5)
      second_level_a = root.insert_left(3)
      second_level_b = root.insert_right(8)
      third_level_a = second_level_a.insert_left(1)
      third_level_b = second_level_a.insert_right(4)
      third_level_c = second_level_b.insert_left(7)
      third_level_d = second_level_b.insert_right(9)
      return root
    } 
    
    let(:btree2){ 
      root = BinaryTreeNode.new(5)
      second_level_a = root.insert_left(3)
      second_level_b = root.insert_right(8)
      third_level_a = second_level_a.insert_left(1)
      third_level_b = second_level_a.insert_right(4)
      third_level_c = second_level_b.insert_left(7)
      third_level_d = second_level_b.insert_right(12)
      forth_level_a = third_level_d.insert_left(10)
      fifth_level_a = forth_level_a.insert_left(9)
      fifth_level_b = forth_level_a.insert_right(11)
      return root
    } 
    
    it "should return 8 as result" do
      expect(btree1.get_second_largest).to eq 8
    end

    it "should return 11 as result" do
      expect(btree2.get_second_largest).to eq 11
    end
  end
end