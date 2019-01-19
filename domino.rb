require 'pry'
def solution(a)
  dominoes = build_domino_pieces(a)
  puts "Input Dominoes: "
  print_dominoes(dominoes)

  # order pairs in one pattern, left always less than right
  order_elements(dominoes)
  isValidDominoes?(dominoes)
end

def isValidDominoes?(dominoes)
  # maintain list of visited pairs
  visited = []

  # the duplicate pair must be on the top
  top = find_top(dominoes, visited)

  return false unless top

  level2 = level2_check(dominoes, top, visited)
  return false unless level2

  # add to visited
  level2.each do |l|
    visited << l
  end

  remaining_nodes = dominoes - visited
  level3 = level3_check(remaining_nodes, level2, visited)
  return false unless level3
  true
end

def level3_check(dominoes, level2, visited)
  leftover_nodes = dominoes - visited
  level2_left = level2.first
  level2_right = level2.last

  left = find_left_match(leftover_nodes, level2_left, visited)
  return false unless left

  visited << left

  leftover_nodes = dominoes - visited
  right = find_right_match(leftover_nodes, level2_right, visited)
  visited << right
  return false unless right

  puts "Result: "
  print_result_dominoes(visited.flatten)
  true
end

def level2_check(dominoes, top, visited)
  left = find_left_match(dominoes, top, visited)
  return false unless left

  right = find_right_match(dominoes, top, visited)
  return false unless right

  left + right
end

def find_right_match(dominoes, top, visited)
  result = []
  dominoes.each do |dom|
    next if visited.include?(dom)
    if top.right == dom.left
      result << dom
      next
    end

    if top.right == dom.right
      result << swap(dom)
    end
  end
  result.empty? ? false : result
end

def find_left_match(dominoes, top, visited)
  result = []
  dominoes.each do |dom|
    next if visited.include?(dom)
    if top.left == dom.right
      result << dom
      next
    end

    if top.left == dom.left
      result << swap(dom)
      next
    end
  end
  result.empty? ? false : result
end

def find_top(dominoes, visited)
  store = {}
  dominoes.each do |dom|
    if store.has_key?(dom.left) && store[dom.left].right == dom.right
      visited << store[dom.left]
      visited << dom
      return dom
    end
    store[dom.left] = dom
  end
  false
end

def order_elements(dominoes)
  dominoes.each do |dom|
    if dom.left > dom.right
      swap(dom)
    end
  end
end

def swap(dom)
  temp = dom.left
  dom.left = dom.right
  dom.right = temp
  dom
end

def build_domino_pieces(a)
  dominoes = []
  index = 0
  while index < a.size
    domino = Domino.new(a[index], a[index + 1])
    index += 2
    dominoes << domino
  end
  dominoes
end

def print_dominoes(dominoes)
  dominoes.each do |dom|
    puts "[ #{dom.left} , #{dom.right} ]"
  end
end

def print_result_dominoes(dominoes)
  top = dominoes.first
  puts "        #{top.left} | #{top.right}    "
  puts "    #{dominoes[2].left} | #{dominoes[2].right}...#{dominoes[3].left} | #{dominoes[3].right} "
  puts "#{dominoes[4].left} | #{dominoes[4].right}...#{top.left} | #{top.right}...#{dominoes[5].left} | #{dominoes[5]
                                                                                                          .right}"

end

class Domino
  attr_accessor :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end
end

a = [4, 5, 4, 3, 3, 4, 1, 2, 2, 3, 6, 5]
a = [7, 9, 2, 8, 8, 22, 22, 29, 29, 7, 22, 29]
# a = [21,7, 34, 36, 36, 2, 54, 21, 34, 36, 2, 5]
result = solution(a)

puts "YES" if result
puts "NO" unless result