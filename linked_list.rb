require "pp"

class Link
  attr_accessor :next, :val
  def initialize(val, next_link)
    @val, @next = val, next_link
  end
end

class LinkedList
  def initialize(head, tail)
    @head, @tail = head, tail
  end

  def include?(val)
    cur_link = @head

    while !cur_link.nil? && cur_link.val != val
      cur_link = cur_link.next
    end

    cur_link
  end

  def delete(val)
    result = false

    if @head.val == val
      @head = @head.next
      result = true
    else
      cur_link = @head
      while cur_link != @tail
        if cur_link.next.val == val
          if cur_link.next == @tail
            @tail = cur_link
          end
          cur_link.next = cur_link.next.next
          result = true
        else
          cur_link = cur_link.next
        end
      end
    end

    result
  end

  def insert(val)
    result = false
    cur_link = @head
    new_link = Link.new(val, nil)

    if cur_link.val > val
      @head = new_link
      new_link.next = cur_link
      result = true
    else
      until cur_link.next.nil? || cur_link.next.val >= val
        cur_link = cur_link.next
      end

      @tail = new_link if cur_link == @tail

      new_link.next = cur_link.next
      cur_link.next = new_link
      result = true
    end

    result
  end

  def push(val)
    new_link = Link.new(val, nil)
    @tail.next = new_link
    @tail = new_link
  end

  def pop
    cur_link = @head
    pop_link = @tail

    if @head == @tail 
      @head = @tail = nil
    else
      until cur_link.next == @tail
        cur_link = cur_link.next
      end

      cur_link.next = nil
      @tail = cur_link
    end

    pop_link
  end

  def find_mth_to_last(m)
    cur_link = mth_el = @head
    cur_pos = 0

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

pp list