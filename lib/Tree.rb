class Node
	attr_accessor :value, :left, :right
	def initialize(value = nil, left = nil, right = nil)
		@value = value
		@left= left
		@right = right
	end
end

class Tree
	attr_accessor :root
	def initialize
		@root = nil
	end
	
	def build_tree(ary, first = 0, last = ary.length)		
		if first>last
			return nil
		end
		mid = (first+last)/2
		#puts ary[mid]
		
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
test_array = [1, 23, 8, 9, 4, 3, 7 , 67, 6345, 324, 5]
test_array = [1, 3, 4, 5, 6, 7, 8, 9, 23, 67, 324, 6345]
test_tree = Tree.new

test_tree.build_tree(test_array.sort)


puts test_tree.root.right.right.left.value