class Node
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  attr_accessor :data
  attr_accessor :left
  attr_accessor :right
end

class Tree
  def initialize(array)
    @data = array.uniq.sort
    @root = build_tree(@data)
  end

  def build_tree(array)
    return nil if array.length == 0

    midpoint = (array.length-1)/2

    # p array[midpoint]
    # p array[0...midpoint]
    # p array[midpoint+1..-1]

    root_node = Node.new(array[midpoint])
    root_node.left = build_tree(array[0...midpoint])
    root_node.right = build_tree(array[midpoint+1..-1])
    return root_node
  end

  def insert(value, node=@root)
    if value == node.data
      return nil
    else
      if value < node.data
        if node.left == nil
          node.left = Node.new(value)
        else
          insert(value, node.left)
        end
      else
        if node.right == nil
          node.right = Node.new(value)
        else
          insert(value, node.right)
        end
      end
    end
  end

  def delete(value, node=@root)
    
    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      if node.left == nil
        return node.right
      elsif node.right == nil
        return node.left
      end

    leftmost_from_right = leftmost(node.right)
    node.data = leftmost_from_right.data
    node.right = delete(leftmost_from_right.data, node.right)
    end
    return node
  end

  def leftmost(node)
    while node.left != nil do
      node = node.left
    end
    return node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  attr_accessor :root
  attr_accessor :data
end 

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree1 = Tree.new(arr)

tree1.pretty_print
tree1.delete(3)
tree1.delete(8)
tree1.pretty_print