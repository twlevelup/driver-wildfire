
class Position
	attr_accessor :x,:y
	attr_accessor :status	#0 - if available, 1 - if not available
	def initialize(x,y)
		@x = x
		@y = y
		@status = 0
	end

	def get_coordinates
		return [x,y]
	end

	def is_valid?(grid)
		x>=grid.x_min && x<=grid.x_max && y>=grid.y_min && y<=grid.y_max
	end

	def set_occupied(grid)
		grid.grid[x][y] = 1
	end

	def is_available?(grid)
		grid.grid[x][y] == 0
	end

	def +(xory)
		case xory
		when :x
			return (Position.new(x+1,y))
		when :y
			return (Position.new(x,y+1))		
		else
			return
		end
	end

	def -(xory)
		case xory
		when :x
			return (Position.new(x-1,y))
		when :y
			return (Position.new(x,y-1))		
		else
			return
		end
	end
end


