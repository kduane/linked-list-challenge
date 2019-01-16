require 'pry'
require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def [](index)
    node = @head
    index.times do
      if !node.next
        return nil
      else
        node = node.next
      end
    end
    node
  end

  def each
    node = @head

    while !node.nil?
      yield(node)
      node = node.next
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def to_s
    text = "LinkedList("
    names = []
    self.each do |node|
      names << node.info
    end
    text += names.join(", ") + ")"
    return text
  end

  def find_tail
    node = @head
    return node if !node.next
    return node if !node.next while (node = node.next)
  end

  def node_at(node, position, counter=0)
    return node if position == counter
    node_at(node.next, position, counter += 1)
  end

  def insert(position, value)
    if position == 0
      self.prepend(value)
    else
      prev_node = @head
      (position - 1).times do
        prev_node = prev_node.next_node
      end

      following_node = prev_node.next_node
      new_node = Node.new(value, following_node)
      prev_node.next = new_node
    end
  end

  def remove(position)
    if position == 0
      @head = self[position].next_node
    else
      prev_node = self[position - 1]
      this_node = self[position]
      next_node = self[position + 1]
      prev_node.next = next_node
      this_node.next = nil
    end
  end

  def find_before(value)
    node = @head
    return false if !node.next
    return node  if node.next.data == value
    while (node = node.next)
      return node if node.next && node.next.data == value
    end
  end

  def print
    node = @head
    puts node
    while (node = node.next)
      puts node
    end
  end

end
