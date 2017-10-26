require_relative 'node'
require 'benchmark'

class BinarySearchTree

  def initialize(root)
    @root = root

  end

  def insert(root, node)
    if root.rating < node.rating
      (root.right.nil?) ? root.right = node : insert(root.right, node)
    else
      (root.left.nil?) ? root.left = node : insert(root.left, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if  data.nil?

    if root.title.eql?(data)
      return root
    elsif !root.left.nil?
      find(root.left, data)
    elsif !root.right.nil?
      find(root.right, data)
    end
  end

  def delete(root, data)
    return nil if data.nil?
    remove = find(root, data)
    remove.title, remove.rating = nil, nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    children = []

    while queue.size > 0
      sub_root = queue.shift
      if sub_root.left != nil
        queue.push(sub_root.left)
      end

      if sub_root.right != nil
        queue.push(sub_root.right)
      end
      children.push("#{sub_root.title} : #{sub_root.rating}")
    end
    children.each { |out| puts out }
  end

end

debate = Node.new("The Great Debaters", 79)
swat = Node.new("S.W.A.T.", 48)
equalizer = Node.new("The Equalizer", 60)
out = Node.new("Get Out", 99)
ride1 = Node.new("Ride Along", 19)
ride2 = Node.new("Ride Along 2", 14)
think = Node.new("Think Like A Man", 79)
think2 = Node.new("Think Like A Man Too", 53)
love = Node.new("Love And Basketball", 82)
last = Node.new("Transformers: The Last Knight", 15)
moon = Node.new("Transformers: Dark Of The Moon", 35)
trans = Node.new("Transformers", 57)

btree = BinarySearchTree.new(debate)

btree.insert(debate, swat)
btree.insert(debate, equalizer)
btree.insert(debate, out)
btree.insert(debate, ride1)
btree.insert(debate, ride2)
btree.insert(debate, think)
btree.insert(debate, think2)
btree.insert(debate, love)
btree.insert(debate, last)
btree.insert(debate, moon)
btree.insert(debate, trans)

btree.printf
#
# count = 0
# numbers = []
#
# until count > 10000
#   numbers << Node.new(count, count)
#   count += 1
# end
#
# numbers_tree  = BinarySearchTree.new(numbers.first)
#
# numbers.each { |num| numbers_tree.insert(numbers.first, count) }
#
# puts Benmark.measure { numbers_tree.find(numbers.first, 5000) }
