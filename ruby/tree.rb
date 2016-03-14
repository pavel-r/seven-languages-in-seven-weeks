class Tree 
	attr_accessor :children, :node_name
	def initialize (tree)
		@node_name = tree.keys[0]
		@children = []
		tree[@node_name].each do |key, value| 
			children.push(Tree.new({key => value}))
		end
	end
	def visit(&block)
		block.call self
	end
	def visit_all(&block)
		visit &block
		@children.each {|child| child.visit_all &block}
	end
end

t = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })
t.visit_all {|n| puts n.node_name}
