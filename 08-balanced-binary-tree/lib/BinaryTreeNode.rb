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
  
  def is_balanced?   
    depths = [] # we short-circuit as soon as we find more than 2
    
    # we'll treat this array as a stack that will store pairs [node, depth]
    nodes = []
    node, depth = nodes.push([self, 0])
    
    while !nodes.empty?
      # pop a node and its depth from the top of our stack
      node, depth = nodes.pop
      
      # case: we found a leaf
      if !node.left && !node.right
        if !depths.include?(depth)
          # we only care if it's a new depth
          depths.push(depth)
          
          # two ways we might now have an unbalanced tree:
          # 1) more than 2 different leaf depths
          # 2) 2 leaf depths that are more than 1 apart
          if(depths.count > 2) || (depths.count == 2 && (depths[0] - depths[1]).abs > 1)
            return false
          end
        end
      else  
        if node.left
          nodes.push([node.left, depth+1])
        end
        if node.right
          nodes.push([node.right, depth+1])
        end
      end
    end
    
    return true
  end
end