require 'spec_helper'

RSpec.describe BinaryTreeNode, type: :model do
  describe "#is_balanced method" do
    let(:single_btree){ BinaryTreeNode.new(10) }
    
    let(:perfect_btree){ 
      root = BinaryTreeNode.new(10)
      second_level_a = root.insert_left(4)
      second_level_b = root.insert_right(15)
      third_level_a = second_level_a.insert_left(2)
      third_level_b = second_level_a.insert_right(6)      
      third_level_c = second_level_b.insert_left(13)
      third_level_d = second_level_b.insert_right(19)
      forth_level_a = third_level_a.insert_left(1)
      forth_level_b = third_level_a.insert_right(3)
      forth_level_c = third_level_b.insert_left(5)
      forth_level_d = third_level_b.insert_right(7)
      forth_level_e = third_level_c.insert_left(11)
      forth_level_f = third_level_c.insert_right(14)
      forth_level_g = third_level_d.insert_left(18)
      forth_level_h = third_level_d.insert_right(20)
      
      return root
    }

    let(:simple_diff_btree){ 
      root = BinaryTreeNode.new(10)
      second_level_a = root.insert_left(4)
      second_level_b = root.insert_right(15)
      third_level_a = second_level_a.insert_left(2)
      third_level_b = second_level_a.insert_right(6)      
      third_level_c = second_level_b.insert_left(13)
      third_level_d = second_level_b.insert_right(19)
      forth_level_a = third_level_a.insert_left(1)
      forth_level_b = third_level_a.insert_right(3)
      forth_level_c = third_level_b.insert_left(5)
      forth_level_d = third_level_b.insert_right(7)
      forth_level_e = third_level_c.insert_left(11)
      forth_level_f = third_level_c.insert_right(14)
      forth_level_g = third_level_d.insert_left(18)
      forth_level_h = third_level_d.insert_right(20)
      fifth_level_a = forth_level_h.insert_left(19)
      fifth_level_b = forth_level_h.insert_right(21)
      
      return root
    }
    
    let(:double_diff_btree){ 
      root = BinaryTreeNode.new(10)
      second_level_a = root.insert_left(4)
      second_level_b = root.insert_right(15)
      third_level_a = second_level_a.insert_left(2)
      third_level_b = second_level_a.insert_right(6)      
      third_level_c = second_level_b.insert_left(13)
      third_level_d = second_level_b.insert_right(19)
      forth_level_a = third_level_a.insert_left(1)
      forth_level_b = third_level_a.insert_right(3)
      forth_level_c = third_level_b.insert_left(5)
      forth_level_d = third_level_b.insert_right(7)
      forth_level_e = third_level_c.insert_left(11)
      forth_level_f = third_level_c.insert_right(14)
      forth_level_g = third_level_d.insert_left(18)
      forth_level_h = third_level_d.insert_right(20)
      fifth_level_a = forth_level_h.insert_left(19)
      fifth_level_b = forth_level_h.insert_right(21)
      sixth_level_a = fifth_level_b.insert_right(23)
      
      return root
    }
    
    let(:non_perfect_btree){ 
      root = BinaryTreeNode.new(10)
      second_level_a = root.insert_left(4)
      second_level_b = root.insert_right(15)
      third_level_a = second_level_a.insert_left(2)
      third_level_d = second_level_b.insert_right(19)
      forth_level_a = third_level_a.insert_left(1)
      forth_level_h = third_level_d.insert_right(20)
      
      return root
    }
    
    it "should return True single node tree" do
      expect(single_btree.is_balanced?).to eq true
    end
    
    it "should return True for perfect tree" do
      expect(perfect_btree.is_balanced?).to eq true
    end
    
    it "should return True for trees with 1 level difference" do
      expect(simple_diff_btree.is_balanced?).to eq true
    end 
    
    it "should return False for trees with 2 level difference" do
      expect(double_diff_btree.is_balanced?).to eq false
    end 

    it "should return True for trees with 2 branches" do
      expect(non_perfect_btree.is_balanced?).to eq true
    end     
  end
end