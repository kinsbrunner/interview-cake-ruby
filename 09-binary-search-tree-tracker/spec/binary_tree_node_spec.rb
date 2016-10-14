require 'spec_helper'

RSpec.describe BinaryTreeNode, type: :model do
  describe "#bst_checker method" do
    let(:btree){ 
      root = BinaryTreeNode.new(50)
      second_level_a = root.insert_left(30)
      second_level_b = root.insert_right(80)
      third_level_a = second_level_a.insert_left(20)
      third_level_b = second_level_a.insert_right(40) # <---
      third_level_c = second_level_b.insert_left(70)
      third_level_d = second_level_b.insert_right(90)
      
      return root
    } 
    
    it "should return True when tree is a Binary Search Tree" do
      expect(btree.bst_checker).to eq true
    end

    it "should return False when tree is not a Binary Search Tree" do
      btree.left.right.value = 60
      expect(btree.bst_checker).to eq false
    end
    
    it "should return True when tree is a Binary Search Tree (recursive call)" do
      expect(btree.bst_checker_recursive).to eq true
    end
    
    it "should return False when tree is not a Binary Search Tree (recursive call))" do
      btree.left.right.value = 60
      expect(btree.bst_checker_recursive).to eq false
    end    
  end
end