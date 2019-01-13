class Node
  attr_accessor :data, :next

  def initialize(data, next_node)
    self.data = data
    self.next = next_node
  end

  def to_s
    "Node with value: #{@value}"
  end

end
