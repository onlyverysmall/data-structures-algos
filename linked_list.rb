require 'pp'

class Link
  attr_accessor :next, :val
  def initialize(val, next_link)
    @val = val
    @next = next_link
  end
end

class LinkedList
  def initialize(head)
    @head = head
  end

  def include?(val)
    cur_link = @head

    while !cur_link.nil? && cur_link.val != val
      cur_link = cur_link.next
    end

    cur_link
  end

  def delete(val)
    cur_link = @head

    if cur_link.val == val
      @head = @head.next
      return "val found at head"
    end

    while !cur_link.next.nil?
      if cur_link.next.val == val
        cur_link.next = cur_link.next.next
        return "val deleted"
      else
        cur_link = cur_link.next
      end
    end

    return "val not found in list"
  end

  def insert(val)
    cur_link = @head
    new_link = Link.new(val, nil)

    if cur_link.val > val
      @head = new_link
      new_link.next = cur_link
      return "inserted before head"
    end

    until cur_link.next.nil? || cur_link.next.val >= val
      cur_link = cur_link.next
    end

    new_link.next = cur_link.next
    cur_link.next = new_link
    
    return "inserted somewhere after head"
  end

  def push(val)
    cur_link = @head
    new_link = Link.new(val, nil)

    until cur_link.next.nil?
      cur_link = cur_link.next
    end

    cur_link.next = new_link
  end

  def pop
    cur_link = @head

    until cur_link.next.next.nil?
      cur_link = cur_link.next
      pop_link = cur_link.next
    end

    cur_link.next = nil
    pop_link
  end
end

l1 = Link.new(5, nil)
l2 = Link.new(10, nil)
l3 = Link.new(15, nil)

l1.next = l2
l2.next = l3

list = LinkedList.new(l1)

list.push(20)
list.push(25)

pp list

list.pop
pp list