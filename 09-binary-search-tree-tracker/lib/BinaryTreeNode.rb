class BinaryTreeNode
  attr_accessor :value
  attr_reader :left, :right
  
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
  
  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    return @left
  end
  
  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    return @right
  end
  
  
  def bst_checker
    # start at the root, with an arbitrarily low lower bound
    # and an arbitrarily high upper bound
    node_and_bounds_stack = []
    node_and_bounds_stack.push([self, -Float::INFINITY, Float::INFINITY])
    
    # depth-first traversal
    while !node_and_bounds_stack.empty?
      node, lower_bound, upper_bound = node_and_bounds_stack.pop
      
      # if this node is invalid, we return false right away
      if (node.value < lower_bound) || (node.value > upper_bound)
        return false
      end
      
      if node.left
        # this node must be less than the current node
        node_and_bounds_stack.push([node.left, lower_bound, node.value])
      end
      
      if node.right
        # this node must be greater than the current node
        node_and_bounds_stack.push([node.right, node.value, upper_bound])
      end
    end
    
    # if none of the nodes were invalid, return true
    # (at this point we have checked all nodes)
    return true
  end
  
  
  def bst_checker_recursive(lower_bound = -Float::INFINITY, upper_bound = Float::INFINITY)
    return true if self.nil? || 
    
    if (self.value > upper_bound || self.value < lower_bound)
      return false
    end
    
    return true if self.left.nil? && self.right.nil?
    
    return self.left.bst_checker_recursive(lower_bound, self.value) && self.right.bst_checker_recursive(self.value, upper_bound)
  end
  
  
  def breadth_first(searched_value) 
    queue = []
    
    queue.push(self)
    while !queue.empty?
      current = queue.shift
      return true if current.value == searched_value
      queue.push(current.left) if !current.left.empty?
      queue.push(current.right) if !current.right.empty?
    end
    return false
  end  
    
  
  def depth_first(searched_value)
    stack = []
    
    stack.push(self)
    while !stack.empty?
      current = stack.pop
      return true if current.value == searched_value
      stack.push(current.left) if !current.left.empty?
      stack.push(current.right) if !current.right.empty?
    end
    return false
  end
  
  
  def depth_first_recursive(searched_value)
    return false if self.nil?
    return true if self.value == searched_value
    depth_first_rec(self.left) || depth_first_rec(self.right)
  end  
end