
class Grid 

	attr_accessor :x_min, :x_max, :y_min, :y_max
	attr_accessor :grid;

	def initialize(x_min, x_max, y_min, y_max)
		@x_min = x_min
		@x_max = x_max
		@y_min = y_min
		@y_max = y_max
		@grid = Array.new(y_max-y_min){Array.new(x_max-x_min," ")}
	end	

	def print_grid
		for i in 0...(y_max)
			for j in 0...(x_max)
				value = @grid[i][j]
				case value
				when 1					
					print "#{value}".on_red.blink
				when 2
					print "#{value}".on_magenta.blink
				when 3
					print "#{value}".on_blue.blink
				when 4
					print "#{value}".on_cyan.blink
				when 5
					print "#{value}".on_green.blink
				when 6
					print "#{value}".on_magenta.blink
				when 7
					print "#{value}".on_red.blink
				when 8
					print "#{value}".on_blue.blink
				when 9
					print "#{value}".on_cyan.blink
				else
					print "#{value}".white.on_yellow.blink
				end
			end
			puts
		end

		return true
	end
end