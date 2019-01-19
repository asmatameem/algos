# http://billleidy.com/blog/advent-of-code-and-graph-data-structure.html

class GraphNode
  attr_accessor :name, :edges

  def initialize(name, edges = [])
    @name = name
    @edges = edges
  end
end

class GraphEdge
  attr_accessor :from_node, :to_node, :weight, :directed

  def initialize(from_node, to_node, weight = nil, directed = false )
    @from_node = from_node
    @to_node = to_node
    @weight = weight
    @directed = directed
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def get_node(name)
    nodes.detect { |n| n.name == name }
  end

  def add_node(name)
    @nodes << GraphNode.new(name)
  end

  def add_all_nodes(names)
    @nodes += names.map { |n| GraphNode.new(n) }
  end

  def add_edge(from_name, to_name, weight = nil, directed = false)
    from_node = get_node(from_name)
    to_node = get_node(to_name)
    from_node.edges << GraphEdge.new(from_node, to_node, weight, directed)
  end

  def size
    nodes.length
  end
end