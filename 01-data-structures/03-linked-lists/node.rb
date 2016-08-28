class Node
  attr_accessor :next
  attr_accessor :data

  def initialize(data)
  	self.data = data
  	self.next = nil
  end

  def set_next(node)
  	self.next = node
  end

end