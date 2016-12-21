class Node
	attr_accessor :value, :left, :right
	def initialize(value = nil, left = nil, right = nil, parent = nil)
		@value = value
		@left= left
		@right = right
		@parent = parent
	end
end

class Tree
	attr_accessor :root
	def initialize
		@root = nil
	end
	
	def build_tree(ary)
		stack = []
		@root = Node.new(ary.pop)
		
		while ary.length>0
			add_node(ary.pop)
		end		
	end
	
	def add_node(value)
		current_node = @root
		correct_position = false	
		
		while !correct_position
			if value < current_node.value && current_node.left == nil
				puts "Adding node (#{value})to left side of #{current_node.value}"
				current_node.left = Node.new(value)
				correct_position = true
			elsif value < current_node.value && current_node.left != nil
				#puts "Dropping from #{current_node.value} to #{current_node.left.value}"
				current_node = current_node.left
			elsif value > current_node.value && current_node.right == nil
				puts "Adding node (#{value})to right side of #{current_node.value}"
				current_node.right = Node.new(value)
				correct_position = true
			elsif value > current_node.value && current_node.right != nil
				#puts "Dropping from #{current_node.value} to #{current_node.right.value}"
				current_node = current_node.right
			else
				puts "nothing done"
			end
		end
		#puts current_node.value
		
	end
	
	def build_tree_rec(ary, first = 0, last = ary.length)		
		if first>last
			return nil
		end
		mid = (first+last)/2
		
		branch = Node.new(ary[mid])
		if @root == nil
			@root = branch
		end
		puts branch.value
		branch.left=build_tree(ary,first, mid-1)
		branch.right=build_tree(ary, mid+1, last)
		return branch
	end	
end
                 #[1, 3, 4, 4, 5, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
test_array = [23, 8, 9, 4,6345, 3, 7, 2 , 67,  324]
#test_array = [1, 3, 4]#, 5, 6, 7, 8, 9, 23, 67, 324, 6345]
test_tree = Tree.new

test_tree.build_tree(test_array)

puts "Root: #{test_tree.root.value}"
puts "Left of root : #{test_tree.root.left.value}"
#puts "Left of #{test_tree.root.left.left.value}: #{test_tree.root.left.left.left.value}"
puts "Left of #{test_tree.root.left.left.right.left.value}: #{test_tree.root.left.left.right.right.right.value} "
#puts "Right of #{test_tree.root.left.left.right.value}: #{test_tree.root.left.left.right..right.value}"