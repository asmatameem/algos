def title_to_number(s)
  n = 0
  while s.length != 0
    n *= 26
    n += (s[0].ord - 65)
    n += 1
    s[0] = ''
  end
  return n
end

s = "AA"
puts title_to_number(s)