

class Grid 

	attr_accessor :x_min, :x_max, :y_min, :y_max

	def initialize(x_min, x_max, y_min, y_max)
		@x_min = x_min
		@x_max = x_max
		@y_min = y_min
		@y_max = y_max
	end	

	def valid_position?(position)
		x = position.x
		y = position.y
		x>=x_min && x<=x_max && y>=y_min && y<=y_min
	end
end