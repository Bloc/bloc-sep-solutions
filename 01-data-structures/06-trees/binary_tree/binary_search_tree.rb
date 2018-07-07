require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating < root.rating && root.left == nil
      root.left = node
    elsif node.rating < root.rating && root.left != nil
      root = root.left
      insert(root, node)
    elsif node.rating > root.rating && root.right == nil
      root.right = node
    elsif node.rating > root.rating && root.right != nil
      root = root.right
      insert(root, node)
    end
  end

  def find(root, data)
    if root.nil? || data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    else
      target_node = find(root, data)
      target_node.nil? ? nil : (target_node.title = nil && target_node.rating = nil)
    end
  end

  def printf
    queue = []
    output = [@root]
    if @root.left != nil
      queue.push(@root.left)
    end
    if @root.right != nil
      queue.push(@root.right)
    end
    queue.each do |q|
      output.push(q)
      if q.left != nil
        queue.push(q.left)
      end
      if q.right != nil
        queue.push(q.right)
      end
    end
    output.each do |o|
      puts "#{o.title}: #{o.rating}"
    end
  end
end
