require "pp"

class Link
  attr_accessor :next, :previous, :val
  def initialize(val, prev_link, next_link)
    @val, @previous, @next = val, prev_link, next_link
  end
end

class DoublyLinkedList
  def initialize(head, tail)
    @head = head
    @tail = tail  
  end

  # return link if present, nil otherwise
  def include?(val)
    cur_link = @head

    while !cur_link.nil? && cur_link.val != val
      cur_link = cur_link.next
    end

    cur_link
  end

  # return true if link found and deleted, false otherwise
  def delete(val)
    result = false
    if @head.val == val
      @head = @head.next
      @head.previous = nil
      result = true
    elsif @tail.val == val
      @tail = @tail.previous
      @tail.next = nil
      result = true
    else
      cur_link, next_link = @head, @head.next

      while cur_link != @tail
        if next_link.val == val
          new_next = next_link.next
          cur_link.next = new_next 
          new_next.previous = cur_link
          result = true
          break
        else
          cur_link = next_link
          next_link = next_link.next
        end
      end
    end

    result
  end

  # return true if link inserted, false otherwise
  def insert(val)
    new_link = Link.new(val, nil, nil)
    
    if @head.val > val
      @head.previous = new_link
      new_link.next = @head
      @head = new_link
    elsif @tail.val < val
      @tail.next = new_link
      new_link.previous = @tail
      @tail = new_link
    else
      cur_link = @head
      until cur_link.next == @tail || cur_link.next.val >= val
        cur_link = cur_link.next
      end

      new_link.previous = cur_link
      new_link.next = cur_link.next
      cur_link.next.previous = new_link
      cur_link.next = new_link
    end
  end
end

l5 = Link.new(25, nil, nil)
l4 = Link.new(20, nil, l5)
l3 = Link.new(15, nil, l4)
l2 = Link.new(10, nil, l3)
l1 = Link.new(5, nil, l2)

l5.previous = l4
l4.previous = l3
l3.previous = l2
l2.previous = l1

list = DoublyLinkedList.new(l1, l5)

pp list