class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

class Depth

  def initialize
    @search_stack = []
  end

  def search(target_value, input_trunk, child_index = 0)
    if input_trunk.payload != target_value
      puts "#{input_trunk.payload} does not equal target"
      @search_stack.push(input_trunk)
      if !input_trunk.children.empty?
        puts "children exist -->"
        search(target_value, input_trunk.children[child_index], child_index)
      else
        puts "children do not exist"
        @search_stack.pop
        child_index = child_index + 1

      end
    else
      puts "value found: #{input_trunk.payload}"
    end
  end



end



# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])
fifteenth_node = Tree.new(15, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node, fifteenth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

new_search = Depth.new
new_search.search(15, trunk)
