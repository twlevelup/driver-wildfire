class Car
    attr_accessor :direction
	  attr_accessor :position
    def initialize (positionObject,direction)

        @position = positionObject
		
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

    def move_to_location(destination)
        commands = []
        position = Position.new(@position.x, @position.y)
        direction = @direction

        # Handle x component
        if position.x < destination.x
            # should be facing east
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
            # should be facing west
            case direction
            when :N
                commands.push(:L)
            when :S
                commands.push(:R)
            when :E
                commands(:L)
                commands(:L)
            end
            direction = :W
        end

        for x in 0...(position.x-destination.x).abs
            commands.push(:F)
        end

        # handle y component
        if position.y < destination.y
            # should be facing north
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
            # should be facing south
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

        return stackCommands(commands)
    end          
end


