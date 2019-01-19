require 'pry'
def solution(n)
  1.upto(n) do |number|
    puts replace_with_word(number)
  end
end

def replace_with_word(number)
  result = ""
  if number % 3 == 0
    result += "Fizz"
  end
  if number % 5 == 0
    result += "Buzz"
  end
  if number % 7 == 0
    result += "Woof"
  end
  result.empty? ? number : result
end

solution(1000)