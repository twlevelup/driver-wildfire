
require './colors'

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
		for i in 0...(y_max)
			for j in 0...(x_max)
				value = @grid[i][j]
				case value
				when 1					
					print Color_Text.change_color("#{value}", "green")
				when 2
					print Color_Text.change_color("#{value}", "red")
				when 3
					print Color_Text.change_color("#{value}", "blue")
				when 4
					print Color_Text.change_color("#{value}", "pink")
				when 5
					print Color_Text.change_color("#{value}", "yellow")
				when 6
					print Color_Text.change_color("#{value}", "cyan")
				when 7
					print Color_Text.change_color("#{value}", "green")
				when 8
					print Color_Text.change_color("#{value}", "red")
				when 9
					print Color_Text.change_color("#{value}", "blue")
				else
					print Color_Text.change_color("#{value}", "grey")
				end
			end
				puts
		end

		return true
	end
end