def solution(a)
  result = 10000000
  p = 1
  q = 3
  while q < a.size - 1
    result = [result, a[p] + a[q]].min
    if a[p] > a[q - 1]
      p = q - 1
    end
    q += 1
  end
  result
end

a = [5, 2, 4, 6, 3, 7]
puts solution(a)