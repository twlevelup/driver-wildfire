

class Grid 

	attr_accessor :x_min, :x_max, :y_min, :y_max
	attr_accessor :grid;

	def initialize(x_min, x_max, y_min, y_max)
		@x_min = x_min
		@x_max = x_max
		@y_min = y_min
		@y_max = y_max
		@grid = Array.new(y_max-y_min+1){Array.new(x_max-x_min+1,0)}
	end	

end