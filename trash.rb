


class Node
	attr_accessor :value, :left, :right, :parent
	def initialize(value = nil, left = nil, right = nil, parent = nil)
		@value = value
		@left= left
		@right = right
		@parent = parent
	end
end

class Tree
	attr_accessor :tree_q
	def initialize
		@root = nil
		@tree_q = []
	end
	
	def build_tree(ary)		
		
		n = ary.length		
		mid = ary[n/2]
		current_node = Node.new(mid)
		tree_q.push(current_node)
		ary_a = ary[0..n/2-1]
		mid_a = ary_a[ary_a.length/2]
		#current_node.left.value = mid_a
		ary_b = ary[n/2+1..n]		
		mid_b = ary_b[ary_b.length/2]
		puts "#{tree_q[tree_q.length-1].value} #{tree_q[tree_q.length-1].left}"
		
		if @root == nil
			@root = mid
		end
		
		if n<=1	
			tree_q.push ary[0]
			return ary
		end		
		
		ary_a = ary[0..n/2-1]
		mid_a = ary_a[ary_a.length/2]
		#current_node.left.value = mid_a
		ary_b = ary[n/2+1..n]		
		mid_b = ary_b[ary_b.length/2]
		#puts "#{tree_q[tree_q.length-1].value} #{tree_q[tree_q.length-1].left}"
		
		
		
		
		#puts "Root: #{@root}"
		#puts "Current Node: #{current_node}"
		#puts ary_a.inspect
		#puts ary_b.inspect
	
		
		build_tree(ary_a)
		build_tree(ary_b)		 
	end
end
                 #[1, 3, 4, 4, 5, 5, 7, 7, 8, 9, 9, 23, 67, 324, 6345]
test_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324, 5]
test_array = test_array.sort

test_tree = Tree.new
test_tree.build_tree(test_array)

