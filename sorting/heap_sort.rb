require 'pry'
require_relative '../sorting/heap.rb'

class HeapSort
  def sort(array)
    heap = Heap.new
    array.each do |element|
      heap.insert(element)
    end

    puts "Heap: #{heap.heap}"

    (0..array.size - 1).each do |index|
      array[index] = heap.get_min
      heap.delete_min
    end

    puts array.join(", ")
  end

end

data_set = [15, 20, 5, 2, 7, 44, 2, 4, 2, 18, 2]
HeapSort.new.sort(data_set)
