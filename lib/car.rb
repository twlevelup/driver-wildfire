class Car

	def initialize (x,y,direction)
		@position = [x,y]
		@direction = direction
	end

	def honk
        'honk honk toot toot beep beep'
    end


    def move 
        if (@position[0] < 0 ) || (@position[1] < 0)
    		"Invalid Starting Position"
    	else
	    	case @direction
	    	when "North"
	    		[@position[0], @position[1]+1]
	    	when "South"
	    		[@position[0], @position[1]-1]
	    	when "East"
	    		[@position[0]+1, @position[1]]
	    	when "West"
	    		[@position[0]-1, @position[1]]
	    	else
	    		"Wrong Direction"
	    	end
	    end
    end
end


