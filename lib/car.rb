class Car
    attr_accessor :direction
	attr_accessor :position
    def initialize (x,y,direction)

        @position = [x,y]
		
        case direction
        when :N ,:S ,:E ,:W
            @direction = direction
        else
            @direction = "Wrong initial direction"
        end
	end

	def honk
        'honk honk toot toot beep beep'
    end


    def move 
        if (@position[0] < 0 ) || (@position[1] < 0)
    		"Invalid Starting Position"
    	else
	    	case @direction
	    	when :N
                @position[1] += 1
                return @position
	    	when :S
	    		@position[1] -= 1
                return @position
	    	when :E
	    		@position[0] += 1
                return @position
	    	when :W
	    		@position[0] -= 1
                return @position
	    	else
	    		"Wrong initial direction"
	    	end
	    end
    end

    def turn_left
    	case @direction
    	when :N
    		@direction = :W
    		#return "#{@direction}"
    	when :S
    		@direction = :E
    		#return "#{@direction}"
    	when :E
    		@direction = :N
    		#return "#{@direction}"
    	when :W
    		@direction = :S
    		#return "#{@direction}"
    	else
    		"Wrong initial direction"
    	end
	end

	def turn_right
        case @direction
        when :N
            @direction = :E
            #return "#{@direction}"
        when :E
            @direction = :S
            #return "#{@direction}"
        when :S
            @direction = :W
            #return "#{@direction}"
        when :W
            @direction = :N
            #return "#{@direction}"
        else
            "Wrong initial direction"
        end
    end            
end


