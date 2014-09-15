class Car
      attr_accessor :index
      attr_accessor :direction
	  attr_accessor :position
      attr_accessor :grid
    def initialize (index, grid, positionObject, direction)

        @grid = grid
        @position = positionObject
        @index = index
        
		
        case direction
        when :N ,:S ,:E ,:W
            @direction = direction
        else
            @direction = "Wrong initial direction"
        end
	end

    def move 
    	case @direction
    	when :N
            if((@position.+(:y).is_valid?(@grid)))
                return (@position.y += 1)
            else
                return @position
            end
    	when :S
            if((@position.-(:y).is_valid?(@grid)))
                return (@position.y -= 1)
            else
                return @position
            end
    	when :E
            if((@position.+(:x).is_valid?(@grid)))
              return (@position.x += 1)
            else
                return @position
            end
    	when :W
            if((@position.-(:x).is_valid?(@grid)))
    		  return (@position.x -= 1)
            else
                return @position
            end

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

    def stack_commands (commandList)
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

    def move_to_location(destination)
        commands = []
        position = Position.new(@position.x, @position.y)
        direction = @direction

        # Handle x component
        if position.x < destination.x
            # should make the car to be facing east
            case direction
            when :N
                commands.push(:R)
            when :S
                commands.push(:L)
            when :W
                commands.push(:R)
                commands.push(:R)
            end
            direction = :E
        elsif position.x > destination.x
            # should make the car to be facing west
            case direction
            when :N
                commands.push(:L)
            when :S
                commands.push(:R)
            when :E
                commands.push(:L)
                commands.push(:L)
            end
            direction = :W
        end

        for x in 0...(position.x-destination.x).abs
            commands.push(:F)
        end

        # handle y component
        if position.y < destination.y
            # should make the car to be facing north
            case direction
            when :E
                commands.push(:L)
            when :W
                commands.push(:R)
            when :S
                commands.push(:L)
                commands.push(:L)
            end
            direction = :N
        elsif position.y > destination.y
            # should make the car to be facing south
            case direction
            when :E
                commands.push(:R)
            when :W
                commands.push(:L)
            when :N
                commands.push(:R)
                commands.push(:R)
            end
            direction = :S
        end

        for y in 0...(position.y-destination.y).abs
            commands.push(:F)
        end

        return stack_commands(commands)
    end          
end


