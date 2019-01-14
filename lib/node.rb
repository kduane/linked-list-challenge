class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    self.data = data
    self.next = next_node
  end

  def info
    self.data
  end

  def to_s
    "Node with value: #{@value}"
  end

  def next_node
    self.next
  end

end
