require '../graph/graph'
require 'pry'
class FindRouteBetweenTwoNodes
  attr_accessor :from, :to, :graph

  def initialize(graph, from, to)
    @graph = graph
    @from = graph.get_node(from)
    @to = graph.get_node(to)
  end

  def detect_route
    visited = []
    queue = Queue.new
    queue.push(from)
    visited << from
    while(!queue.empty?)
      current = queue.pop
      neighbors = current.edges.map(&:to_node)
      neighbors.each do |node|
        unless visited.include?(node)
          if node == to
            return true
          end
        end
        queue.push(node)
      end
      visited << current
    end
    return false
  end
end

graph = Graph.new
nodes = ['a', 'b', 'c', 'd']
graph.add_all_nodes(nodes)
edges = {
  'a' => ['b', 'd'],
  'b' => ['c'],
  'd' => ['b']
}

edges.each_pair do |from, to_nodes|
  to_nodes.each do |n|
    graph.add_edge(from, n)
  end
end

from = 'a'
to = 'c'

route_detector = FindRouteBetweenTwoNodes.new(graph, from, to)
puts route_detector.detect_route