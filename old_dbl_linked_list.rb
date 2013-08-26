require 'pp'

class Link
  attr_reader :value
  attr_accessor :next, :previous

  def initialize(value)
    @value = value
    @next = nil
    @previous = nil
  end
end

class DoublyLinkedList
  attr_reader :head, :tail

  def initialize(head, tail)
    @head = head
    @tail = tail
  end

  def include?(val)
    current_node = @head
    until current_node.value >= val || current_node == @tail
      current_node = current_node.next
    end
    return current_node.value == val
  end

  def insert(val)
    current_node = @head
    until current_node.value >= val || current_node == @tail
      current_node = current_node.next
    end
    return if current_node.value == val

    new_link = Link.new(val)

    if current_node == @head
      @head.previous = new_link
      new_link.next = @head
      @head = new_link
    elsif current_node == @tail && val > @tail.value
      @tail.next = new_link
      new_link.previous = @tail
      @tail = new_link
    else
      current_node.previous.next = new_link
      new_link.previous = current_node.previous
      current_node.previous = new_link
      new_link.next = current_node
    end
  end
end

l1 = Link.new(5)
l2 = Link.new(10)
l3 = Link.new(15)

l1.next = l2
l2.next = l3

l2.previous = l1
l3.previous = l2

list = DoublyLinkedList.new(l1, l3)

list.insert(2000)
puts list.include?(2000)

pp list.tail.value
pp l3.next.value