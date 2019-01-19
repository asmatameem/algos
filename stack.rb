require 'pry'

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class Stack
  attr_accessor :top

  def initialize
    @top = nil
  end

  def push(value)
    new_node = Node.new(value)
    if isEmpty?
      new_node.next = nil
    else
      new_node.next = @top
    end
    @top = new_node
    puts "Inserted #{new_node.value}"
  end

  def isEmpty?
    @top.nil?
  end

  def pop
    raise "Stack is empty" if isEmpty?
    value = @top.value
    @top = @top.next
    value
  end

  def print
    return -1 if isEmpty?
    current = @top
    while(current != nil)
      puts current.value
      current = current.next
    end
  end
end

def is_number?(str)
  str.to_i.to_s == str
end

def solution(s)
  operations = s.split(" ")
  stack = Stack.new
  operations.each do |op|
    if is_number?(op)
      stack.push(op)
    end

    case op
      when "DUP"
        stack.push(stack.top.value)
      when "POP"
        begin
          stack.pop
        rescue
          return -1
        end
      when "+"
        begin
          element1 = stack.pop
          element2 = stack.pop
          stack.push(element1.to_i + element2.to_i)
        rescue
          return -1
        end
      when "-"
        begin
          element1 = stack.pop
          element2 = stack.pop
          stack.push(element1.to_i - element2.to_i)
        rescue
          return -1
        end
    end
  end
  return stack.top.value
end

# input = "13 DUP 4 POP 5 DUP + DUP + -"
# input = "-"
# input = '3 DUP 5 - -'
puts solution(input)



