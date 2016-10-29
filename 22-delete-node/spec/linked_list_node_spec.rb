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
end