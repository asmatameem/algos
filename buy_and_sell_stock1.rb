require 'pry'

class Stock
  def self.max_profit(prices)
    result = 0
    prices.each_with_index do |price, index|
      buy = price
      sell = price.at(index + 1)
      diff = sell - buy
      if diff > 0 && diff > result
        result = diff
      end
    end
    result
  end

  def self.hussain(prices)
    sum = 0
    prices.each_with_index do |price, index|
      return sum if index == prices.size - 1
      buy = price
      sell = prices.at(index + 1)
      diff = sell - buy
      if diff > 0
        sum += diff
      end
    end
    sum
  end
end

# prices = [10, 32, 9, 34, 8, 45, 3 , 100]

prices = [3, 2, 6, 5, 0, 3]
# puts Stock.max_profit(prices)
# puts Stock.max_profile_multiple(prices)
puts Stock.hussain(prices)
