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
	
	#adds a node with given value to the tree
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
		branch.left=build_tree_rec(ary,first, mid-1)
		branch.right=build_tree_rec(ary, mid+1, last)
		return branch
	end		
	
	#breadth first search
	def bfs(value)
		queue = [@root]
		current_node = @root
		match_node = nil

		loop do					
			queue.push(current_node.left) if current_node.left != nil			
			queue.push(current_node.right) if current_node.right != nil				
			current_node = queue[0]
	
			if queue[0].value == value
				match_node = queue[0]
			end
			
			queue.shift			
			break if queue[0] == nil
		end
		
		return match_node
	end
	
	#depth first search
	def dfs(value)
		stack = [@root]
		current_node = @root
		
		while stack[0] != nil
			current_node = stack.pop
			stack.push(current_node.right) if current_node.right != nil
			stack.push(current_node.left) if current_node.left != nil		
			return current_node if value == current_node.value			
		end	
	end		
				

	#depth first search, but done recursively
	def dfs_rec(node = @root, target)
		if node.value == target
			return node
		end
		left = dfs_rec(node.left, target) if node.left
		right = dfs_rec(node.right, target) if node.right
		
		left or right
		
	end
end
                 #[1, 3, 4, 4, 5, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
test_array = [23, 8, 9, 4,6345, 3, 7, 2 , 67,  324].sort
#test_array = [1, 3, 4]#, 5, 6, 7, 8, 9, 23, 67, 324, 6345]
test_tree = Tree.new
test_tree.build_tree_rec(test_array)

puts test_tree.dfs_rec(6345).value

