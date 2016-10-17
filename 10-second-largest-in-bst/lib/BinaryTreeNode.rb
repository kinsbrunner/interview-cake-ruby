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
  
  def find_largest
    current = self
    while current
      return current.value if current.right.nil?
      current = current.right
    end
  end
  
  def get_second_largest
    if self.left.nil? && self.right.nil?
      raise Exception, 'Tree must have at least 2 nodes.'
    end
    
    current = self
    while current
      # case: current is largest and has a left subtree
      # 2nd largest is the largest in that subtree
      if !current.left.nil? && current.right.nil?
        return current.left.find_largest
      end
      
      # case: current is parent of largest, and
      # largest has no children, so
      # current is 2nd largest
      if !current.right.nil? && current.right.left.nil? && current.right.right.nil?
        return current.value
      end
      
      current = current.right
    end
  end
  
  def find_largest_rec
    if !self.right.nil?
      self.right.find_largest_rec
    end
    return self.value
  end
  
  def get_second_largest_rec
    # case: empty tree
    return nil if !self
    
    # case: we're currently at largest, and
    # largest has a left subtree
    # 2nd largest is largest in said subtree
    if !self.left.nil? && self.right.nil?
      return self.left.find_largest_rec
    end
    
    # case: we're at parent of largest,
    # and largest has no left subtree
    # so largest must be current node
    if !self.right.nil? && self.right.left.nil? && self.right.right.nil?
      return self.value
    end
    
    # otherwise: step right
    return get_second_largest_rec(self.right)
  end
end