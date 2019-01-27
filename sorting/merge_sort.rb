require 'pry'

class MergeSort

  def in_place_sort(array, start, finish)
    if start >= finish
      puts "Base condition for #{start}::#{finish}"
      return
    end

    # avoid just using (start + end)/2 because for large arrays it can cause int to overflow
    mid = start + (finish - start)/2
    puts "Start: #{start}, Finish: #{finish}, Mid: #{mid}"
    # sort(array, start, mid)
    # sort(array, mid + 1, finish)
    merge(array, start, mid, finish)
  end

  def sort(array)
    if array.length <= 1
      return array
    end

    mid = array.length/2

    left_array = array[0..mid - 1]
    right_array = array[mid..- 1]

    puts "left array: #{left_array}"
    puts "right array: #{right_array}"
    sort(left_array)
    sort(right_array)

    puts "Before merge: #{array}: #{left_array}:#{right_array}}"

    left_index = right_index = out_index = 0

    while(left_index < left_array.length && right_index < right_array.length)
      if(left_array[left_index] <= right_array[right_index])
        array[out_index] = left_array[left_index]
        left_index += 1
        out_index += 1
      else
        array[out_index] = right_array[right_index]
        right_index += 1
        out_index += 1
      end
    end

    while left_index < left_array.length
      array[out_index] = left_array[left_index]
      left_index += 1
      out_index += 1
    end

    while right_index < right_array.length
      array[out_index] = right_array[right_index]
      right_index += 1
      out_index += 1
    end

    puts "After merge: #{array}"
  end

  def merge(array, start, mid, finish)
    puts "left array: #{array[start..mid]}"
    puts "right array: #{array[mid + 1..finish]}"

    left_index = start
    right_index = mid + 1
    out_index = 0
    out = []

    while(left_index <= mid && right_index <= finish)
      if(array[left_index] <= array[right_index])
        out[out_index] = array[left_index]
        left_index += 1
        out_index += 1
      else
        out[out_index] = array[right_index]
        right_index += 1
        out_index += 1
      end
    end

    if left_index <= mid
      out += array[left_index..mid]
    end

    if right_index <= finish
      out += array[right_index..finish]
    end
    array[start..finish] = out
    puts "After merge: #{array}"
  end
end

array =[15, 20, 4, 25, 3, 14, 19]
MergeSort.new.sort(array)
puts "Sorted Array: #{array}"
