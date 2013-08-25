require 'pp'

class Link
  attr_accessor :next, :val
  def initialize(val, next_link)
    @val = val
    @next = next_link
  end
end

class LinkedList
  def initialize(head, tail)
    @head = head
    @tail = tail
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

    while cur_link != @tail
      if cur_link.next.val == val
        if cur_link.next == @tail
          @tail = cur_link
        end
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

    if cur_link == @tail
      @tail = new_link
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
    @tail = new_link
  end

  def pop
    cur_link = @head

    until cur_link.next == @tail
      cur_link = cur_link.next
      pop_link = cur_link.next
    end

    cur_link.next = nil
    @tail = cur_link
    pop_link
  end

  def find_mth_to_last(m)
    cur_link = @head
    cur_pos = 0
    mth_el = @head

    until cur_link == @tail
      cur_link = cur_link.next
      cur_pos += 1
      if cur_pos > m
        mth_el = mth_el.next
      end
    end
    
    return nil if cur_pos < m
    mth_el
  end
end

l5 = Link.new(25, nil)
l4 = Link.new(20, l5)
l3 = Link.new(15, l4)
l2 = Link.new(10, l3)
l1 = Link.new(5, l2)

list = LinkedList.new(l1, l5)

pp list.find_mth_to_last(5)