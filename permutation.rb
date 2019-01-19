#
# [1, 2, 3, 4]
# [1], [2,3,4]
#
# [2, 1, 3, 4]
# [2, 3, 1, 4]
# [2, 3, 4, 1]
#
# [2] [1,3,4]
# [1, 2, 3, 4]
# [1, 3, 2, 4]
# [1, 3, 4, 2]
#
# [3] [1, 2, 4]
# [1,3,2,4]
# [1,2,3,4]
# [1,2,4,3]

require 'pry'
require 'set'

def permutation(input)
  result = Set.new
  input.chars.each_with_index do |element, index|
    subset = input[0...index] + input[index + 1..-1]
    result.merge compute(element, subset)
  end
  result
end

def compute(element, subset)
  result = []
  (1..subset.size).each do |index|
    result.push subset[0...index] + element + subset[index..-1]
  end
  result
end

input = '1234'
result = permutation(input)
result.each do |r|
  puts r
end
