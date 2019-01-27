require 'pry'

class QuickSort
  # 15, 20, 5, 2, 31, 44, 64, 4, 7, 18, 55
  # pivot index = 0
  # 15, 18, 5, 2, 4, 7, 20, 31, 44, 64, 55
  # partitioned at 6

  def sort(array, start, fin)
    if start == fin  # captures the idea of array being of one element
      puts "Base condition1: #{start}::#{fin}"
      return
    end

    # captures the idea of array being of size 0 # start == fin + 1
    if start > fin
      puts "Base condition2: #{start}::#{fin}"
      return
    end

    pivot_index = choosePivot(array, start, fin)

    partition_index = partition(array, start, fin, pivot_index)

    sort(array, start, partition_index - 1)
    sort(array, partition_index + 1, fin)
  end

  # return the position of the pivot after partitioning the original array
  def partitionx(array, start, fin, pivot_index)
    le_count = 0
    pivot_value = array[pivot_index]
    puts "Partitioning for value: #{pivot_value}: #{array}"
    puts "Start:Fin #{start}:: #{fin}:: #{pivot_index}"
    array[start..fin].each do |element|
      le_count += 1 if element <= pivot_value
    end

    new_array = []
    puts "LE count: #{le_count}"
    new_array[le_count - 1] = pivot_value
    left_index = 0 # 5
    right_index = le_count # 1
    index = start
    array[start..fin].each do |element|
      puts "Element: #{element}: #{index}:: #{pivot_index}"
      if index == pivot_index
        index += 1
        next
      end

      if element <= pivot_value
        puts "Copying to left #{element} to #{left_index}"
        new_array[left_index] = element
        left_index += 1
      else
        puts "Copying #{element} to #{right_index}"
        new_array[right_index] = element
        right_index += 1
      end
    end
    puts "before replacing: #{array} : #{array[start..fin]}:: #{new_array}"
    j = 0
    (start..fin).each do |index|
      puts "index: #{index}"
      array[index] = new_array[j]
      j += 1
    end

    puts "New array: #{array}"
    puts "new pivot index: #{array.index(pivot_value)}"
    array.index(pivot_value)
  end

  def partition(array, start, fin, pivot_index)
    pivot_value = array[pivot_index]
    puts "Current array: #{array[start..fin]}::#{pivot_index}"

    swap(array, pivot_index, fin)
    index = start
    last = fin - 1
    for i in start..last
      if array[i] <= pivot_value
        swap(array, i, index)
        index += 1
      end
    end
    swap(array, fin, index)
    index
  end

  # returns the index of chosen pivot
  def choosePivot(array, start, fin)
    return start
  end


  def swap(array, index1, index2)
    temp = array[index1]
    array[index1] = array[index2]
    array[index2] = temp
  end

end

array = [15, 20, 5, 2, 7, 44, 2, 4, 18]
#
# array = [1,2,3,4,5,6,7]
QuickSort.new.sort(array, 0, array.length - 1)
puts array.join(", ")

# swap more expensive than comparing 2 elements
# Heap gives you the ability to keep the tree balanced with log(n) - left complete tree, complexity and can be stored in an array.

