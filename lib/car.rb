class Car
    attr_accessor :direction
	  attr_accessor :position
      attr_accessor :grid
    def initialize (grid, positionObject, direction)

        @grid = grid
        @position = positionObject
        
		
        case direction
        when :N ,:S ,:E ,:W
            @direction = direction
        else
            @direction = "Wrong initial direction"
        end
	end

    def move 

        @temp_pos = @position
    	case @direction
    	when :N
                @position.y += 1
                return @position
    	when :S
    		@position.y -= 1
            return @position
    	when :E
    		@position.x += 1
            return @position
    	when :W
    		@position.x -= 1
            return @position
    	else
    		"Wrong initial direction"
    	end
    end

    def turn_left
    	case @direction
    	when :N
    		@direction = :W
    	when :S
    		@direction = :E
    	when :E
    		@direction = :N
    	when :W
    		@direction = :S
    	else
    		"Wrong initial direction"
    	end
	end

	def turn_right
        case @direction
        when :N
            @direction = :E
        when :E
            @direction = :S
        when :S
            @direction = :W
        when :W
            @direction = :N
        else
            "Wrong initial direction"
        end
    end

    def stackCommands (commandList)
        commandList.each do |item| 
            case item
            when :F
                move()
            when :L 
                turn_left()
            when :R 
                turn_right()
            else
                "Wrong Command"
            end
        end
    end            
end


