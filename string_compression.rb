require 'pry'
def string_compress(input)
  index = 0
  result = ""
  while(index < input.size)
    char = input[index]
    count = 0
    while(input[index] == char)
      count += 1
      index += 1
    end
    result += "#{char}#{count}"
  end
  result.size < input.size ? result : input
end

def string_compress2(input)
  result = ""
  current = input[0]
  count = 1
  input.chars.drop(1).each_with_index do |char|
    if char == current
      count += 1
      next
    end
    result += "#{current}#{count}"
    current = char
    count = 1
  end
  result += "#{current}#{count}"
  puts result
  result.size < input.size ? result : input
end

input = "aabcccccaaa"
# input = "aab"
puts string_compress2(input)
