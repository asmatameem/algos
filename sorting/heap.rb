require 'pry'

class Heap

  attr_accessor :heap, :size

  def initialize
    @heap = [nil]
    @size = 0
  end

  def insert(data)
    index = size + 1
    heap[index] = data
    # puts "Before Heapify: #{heap}"
    @size += 1
    heapifyUp(index)
    # puts "After Heapify: #{heap}"
  end

  def heapifyUp(index)
    return unless valid?(index)
    parent = heap[index/2]

    while(!parent.nil? && parent > heap[index])
      swap(index/2, index)
      index = index/2
      parent = heap[index/2]
    end
  end

  def get_min
    heap[1]
  end

  def delete_min
    # swap min element with the last element
    puts "Current Heap: #{heap}"
    swap(1, size)
    heap.pop
    @size -= 1
    heapifyDown(1)
  end

  def heapifyDown(index)
    while(left_index(index) <= size)
      child_index = minChildIndex(index)
      if heap[index] > heap[child_index]
        swap(index, child_index)
      end
      index = child_index
    end
    puts "After heapify down: #{heap}"
  end

  def minChildIndex(index)
    if right_index(index) > size
      return left_index(index)
    end

    child_index = left_child(index) < right_child(index) ? left_index(index) : right_index(index)
    return child_index
  end

  def valid?(index)
    index >= 1 && index <= size
  end

  def left_index(index)
    2 * index
  end

  def right_index(index)
    2*index + 1
  end

  def left_child(index)
    heap[left_index(index)]
  end

  def right_child(index)
    heap[right_index(index)]
  end

  def swap(parent_index, child_index)
    temp = heap[parent_index]
    heap[parent_index] = heap[child_index]
    heap[child_index] = temp
  end
end


