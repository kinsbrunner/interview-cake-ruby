require 'spec_helper'

RSpec.describe LinkedListNode, type: :model do
  describe "#delete_node method" do 

  end

  describe "#contains_cycle method" do 
    let(:head) { 
      a = LinkedListNode.new('A')
      b = LinkedListNode.new('B')
      c = LinkedListNode.new('C')
      a.next = b
      b.next = c 
      return a
    }
    
    it "should recognize there is a cycle" do
      last = head.next.next
      last.next = head
      expect(head.contains_cycle).to eq true
    end
    
    it "should recognize there is a cycle" do
      head.next = head
      expect(head.contains_cycle).to eq true
    end
    
    it "should recognize there is NO cycle" do
      expect(head.contains_cycle).to eq false
    end
  end

  describe "#kth_to_last_node method" do 
    let(:head) { 
      head = LinkedListNode.new('A')
      b = LinkedListNode.new('B')
      c = LinkedListNode.new('C')
      d = LinkedListNode.new('D')
      head.next = b
      b.next = c
      c.next = d
      return head
    }

    it "should return B" do
      expect(head.kth_to_last_node(3).value).to eq 'B'
    end

    it "should return A" do
      expect(head.kth_to_last_node(4).value).to eq 'A'
    end

    it "Exception should be triggered" do
      expect{head.kth_to_last_node(0)}.to raise_error(ArgumentError)
    end
  end
end