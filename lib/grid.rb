

class Grid 

	attr_accessor :x_min, :x_max, :y_min, :y_max
	attr_accessor :grid;

	def initialize(x_min, x_max, y_min, y_max)
		@x_min = x_min
		@x_max = x_max
		@y_min = y_min
		@y_max = y_max
		@grid = Array.new(y_max-y_min){Array.new(x_max-x_min,0)}
	end	

	def print_grid

		@grid[10][30] = 1
		@grid[10][31] = 1
		@grid[10][32] = 1
		@grid[10][33] = 1

		for i in 0...(y_max)
			for j in 0...(x_max)
				print @grid[i][j]
			end
				puts
		end

		return true
	end
end