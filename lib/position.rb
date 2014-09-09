
class Position
	attr_accessor :x,:y
	def initialize(x,y)
		@x = x
		@y = y
	end

	def get_coordinates
		return [x,y]
	end

	def is_valid?(grid)
			x>=grid.x_min && x<=grid.x_max && y>=grid.y_min && y<=grid.y_min
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
end


