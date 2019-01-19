class QuickSort
  # 15, 20, 5, 2, 31, 44, 64, 4, 7, 18, 55
  # pivot = 1
  # 15, 18, 5, 2, 4, 7, 20, 31, 44, 64, 55
  # partitioned at 6

  def quickSort(array, start, finish)
    if array.length <= 1
      return array
    end

    pivot_index = choosePivot(array, start, finish)
    partition_index = partition(array, start, finish, pivot_index)

    quickSort(array, start, partition_index - 1)
    quickSort(array, partition_index, finish)
  end

  # returns the index of chosen pivot
  def choosePivot(array, start, finish)

  end

  # return the position of the pivot after partitioning
  def partition(arry, start, finish, pivot_index)
  end
end


# 1 2 3 4 5 6

# 0

#   1 2 3 4 5 6

# 0


