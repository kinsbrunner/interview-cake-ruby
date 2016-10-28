class LinkedListNode
  attr_accessor :value, :next
  
  def initialize(value)
    @value = value
    @next = nil
  end
  
  def delete_node()
    # get the input node's next node, the one we want to skip to
    next_node = self.next

    if next_node
      # replace the input node's value and pointer with the next
      # node's value and pointer. the previous node now effectively
      # skips over the input node
      self.value = next_node.value
      self.next  = next_node.next
    else
      # eep, we're trying to delete the last node!
      raise "Can't delete the last node with this method!"
    end
  end
end