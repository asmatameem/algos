require '../linked_list/linked_lists'
require '../linked_list/node'
require 'pry'
class SumLinkedList
# 7  1 6 , 5 9 2

  # 617 + 295
  def add(l2, l1)
    result = LinkedLists.new
    n1 = l1.head
    n2 = l2.head
    remainder = 0
    while(n1 != nil && n2 != nil)
      current_sum = n1.value + n2.value + remainder
      remainder = current_sum / 10
      last_digit = current_sum % 10
      result.add(last_digit)
      n1 = n1.next
      n2 = n2.next
    end

    while n1 != nil
      result.add(n1.value + remainder)
      n1 = n1.next
    end

    while n2 != nil
      result.add(n2.value + remainder)
      n2 = n2.next
    end
    result.print
  end
end

l1 = LinkedLists.new
l1.add(7)
l1.add(1)
l1.add(6)

l1.print

l2 = LinkedLists.new
l2.add(5)
l2.add(9)

l2.print

SumLinkedList.new.add(l1, l2)