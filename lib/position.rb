
class Position
	attr_accessor :x,:y
	def initialize(x,y)
		@x = x
		@y = y
	end

	def get_coordinates
		return [x,y]
	end

	def is_valid?(position, grid)
			x = position.x
			y = position.y
			x>=grid.x_min && x<=grid.x_max && y>=grid.y_min && y<=grid.y_min
	end

end


