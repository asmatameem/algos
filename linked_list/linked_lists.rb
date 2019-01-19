require '../linked_list/node'
require 'pry'
class LinkedLists
  attr_accessor :head

  def add(value)
    new_node = Node.new(value)
    unless head
      @head = new_node
      return
    end

    current = head
    while(current.next != nil)
      current = current.next
    end
    current.next = new_node
  end

  def insert_middle(node_value, new_value)
    new_node = Node.new(new_value)
    current = head
    while(current != nil)
      if current.value == node_value
        temp = current.next
        current.next = new_node
        new_node.next = temp
        break
      end
      current = current.next
    end
  end

  def reverse
    prev = head # 1
    current = prev.next #2
    prev.next = nil
    next_node = current.next # 3
    while(next_node != nil)
      current.next = prev # 2 -> 1, # 3 -> 2 , # 4 -> 3
      prev = current # 2, #3, #4
      current = next_node # 3, # 4, #5
      next_node = next_node.next # 4, #5, # nil
    end
    current.next = prev
    @head = current
  end

  def reverse2
    current = head # 1
    prev = nil
    while(current != nil)
      next_node = current.next
      current.next = prev # 1-> nil
      prev = current # 2, #3, #4
      current = next_node # 3, # 4, #5
    end
    @head = prev
  end

  def palindrome?

  end

  def print
    current = head
    while(current != nil)
      puts current.value
      current = current.next
    end
  end
end

#
linked_list = LinkedLists.new
linked_list.add(10)
linked_list.add(20)
linked_list.add(30)
linked_list.add(40)
linked_list.add(50)

linked_list.print

# linked_list.insert_middle(40, 35)
# linked_list.print

puts "Reverse"
linked_list.reverse
linked_list.print