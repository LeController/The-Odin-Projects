class Node
	def initialize(data, parent=nil)
		@data = data
		@parent = parent
	end
	
	attr_reader :data
	attr_reader :parent
end

def reached_end?(next_positions, knight_end_pos)
	next_positions.any? do |node| 
		if node.data == knight_end_pos.data
			return true
		end
	end
	return false
end

def make_moves(current_pos, knight_end_pos, queue, parent=knight_start_pos)

	possible_moves = [[1,2], [2,1], [2,-1], [1,-2],
								  [-1,-2], [-2,-1], [-2,1], [-1,2]]

	next_positions = []

	for possible_move in possible_moves
		next_move = []
		possible_move.each_with_index do |pos, index| 
			next_move.push(pos + current_pos.data[index])
		end

		if next_move.any? { |num| num > 8 || num < 1 }
			next
		else
			next_positions.push(Node.new(next_move, parent))
		end
	end

	for next_position in next_positions
		queue.push(next_position)
	end

	if reached_end?(next_positions, knight_end_pos)
		puts "KNIGHT HAS ARRIVED."
		moves = []
		for next_position in next_positions
			if next_position.data == knight_end_pos.data
				parent_node = next_position
				while parent_node.parent != nil do
					moves.unshift(parent_node.data)
					# p parent_node
					parent_node = parent_node.parent
				end
				puts "Your knight has arrived in #{moves.length-1} moves! The steps were:"
				for move in moves
					p move
				end
				return
			end
		end
		return
	else
		up_next = queue.shift
		make_moves(up_next, knight_end_pos, queue, parent=up_next)
	end
end

def knight_moves(start_pos, end_pos)

	queue = []
	root = Node.new([-1,-1])

  knight_start_pos = Node.new(start_pos, root)
	knight_end_pos = Node.new(end_pos)

	make_moves(knight_start_pos, knight_end_pos, queue, knight_start_pos)
end

knight_moves([1,1],[7,8])