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
  
  def contains_cycle()
    # start both runners at the beginning
    slow_runner = self
    fast_runner = self

    # until we hit the end of the list
    while fast_runner != nil && fast_runner.next != nil
      slow_runner = slow_runner.next
      fast_runner = fast_runner.next.next

      # case: fast_runner is about to "lap" slow_runner
      if fast_runner == slow_runner
        return true
      end
    end

    # case: fast_runner hit the end of the list
    return false
  end

  def reverse()
    current = self
    previous = nil
    next_node = nil

    # until we have 'fallen off' the end of the list
    while current
        # copy a pointer to the next element
        # before we overwrite current.next
        next_node = current.next

        # reverse the 'next' pointer
        current.next = previous

        # step forward in the list
        previous = current
        current = next_node
    end

    previous
  end
  
  def print_list()
    list_node = self
    while list_node
      print "#{list_node.value} --> "
      list_node = list_node.next
    end
    print "nil\n"
  end

  def kth_to_last_node(k)
    if k < 1
      raise ArgumentError, "Impossible to find less than first to last node: #{k}"
    end

    left_node  = self
    right_node = self

    # move right_node to the kth node
    (0...k - 1).each do |x|
      # but along the way, if a right_node doesn't have a next,
      # then k is greater than the length of the list and there
      # can't be a kth-to-last node! we'll raise an error
      if !right_node.next
        raise ArgumentError, "k is larger than the length of the linked list: #{k}"
      end

      right_node = right_node.next
    end

    # starting with left_node on the head,
    # move left_node and right_node down the list,
    # maintaining a distance of k between them,
    # until right_node hits the end of the list
    while right_node.next
      left_node  = left_node.next
      right_node = right_node.next
    end

    # since left_node is k nodes behind right_node,
    # left_node is now the kth to last node!
    left_node
  end
end


=begin
head = LinkedListNode.new('A')
b = LinkedListNode.new('B')
c = LinkedListNode.new('C')
d = LinkedListNode.new('D')
head.next = b
b.next = c
c.next = d
head.print_list
=end
