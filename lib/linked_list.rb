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
    if node_at(@head, position - 1).nil?
      prepend(value)
    else
      node = Node.new(value)
      prior_node = node_at(@head, position - 1)
      next_node = node_at(@head, position)
      prior_node.next = node
      node.next = next_node
      return node
    end
  end

  def find(value)
    node = @head
    return false if !node.next
    return node  if node.value == value
    while (node = node.next)
      return node if node.value == value
    end
  end

  def remove(value)
    if @head.value == value
      @head = @head.next
      return
    end
    node      = find_before(value)
    node.next = node.next.next
  end

  def find_before(value)
    node = @head
    return false if !node.next
    return node  if node.next.value == value
    while (node = node.next)
      return node if node.next && node.next.value == value
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
