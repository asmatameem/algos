require 'pry'
# http://www.byte-by-byte.com/autocomplete/
class Node
  attr_accessor :prefix, :children, :isWord

  def initialize(prefix = "", children = {}, isWord = false)
    @prefix = prefix
    @children = children
    @isWord = isWord
  end
end

class Autocomplete
  attr_reader :trie
  def initialize(dictionary)
    @trie = Node.new("")
    dictionary.each do |word|
      insert_word(word)
    end
  end

  def insert_word(word)
    current_node = trie
    word.chars.each_with_index do |char, index|
      unless current_node.children.has_key?(char)
        current_node.children[char] = Node.new(word[0..index])
      end
      current_node = current_node.children[char]
      current_node.isWord = true if index == word.size - 1
    end
  end

  def get_words_for_prefix(prefix)
    results = []
    current_node = trie
    prefix.chars.each do |char|
      if current_node.children.has_key?(char)
        current_node = current_node.children[char]
      else
        return results
      end
    end

    find_all_child_words(current_node, results)
    return results
  end

  def find_all_child_words(node, results)
    if node.isWord
      results.push(node.prefix)
    end
    node.children.keys.each do |key|
      find_all_child_words(node.children[key], results)
    end
  end
end


dictionary = ["a", "and", "ant", "doc", "doctor", "dockyard", "docks", "comp"]
dictionary = Autocomplete.new(dictionary)
puts dictionary.get_words_for_prefix("d")

