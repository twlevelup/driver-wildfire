class Car
      attr_accessor :index
      attr_accessor :direction
	  attr_accessor :position
      attr_accessor :grid
      attr_accessor :car_status
    def initialize (index, grid, position_object, direction)

        @grid = grid
        @position = position_object
        @index = index
        @car_status = 0 # 0-available , 1-not available
        
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
            if (@position.+(:y).is_valid?(@grid)) 
                while (true) do
                    if (@position.+(:y).is_available?(@grid))                        
                        @position.+(:y).set_occupied(@grid, @index)
                        @position.set_available(@grid)
                        @position.y += 1
                        return @position
                    end
                end
            else
                return @position
            end
    	when :S
            if (@position.-(:y).is_valid?(@grid)) 
                while (true) do
                    if (@position.-(:y).is_available?(@grid))
                        @position.-(:y).set_occupied(@grid, @index)
                        @position.set_available(@grid)
                        @position.y -= 1
                        return @position
                    end
                end
            else
                return @position
            end
        when :E
            if (@position.+(:x).is_valid?(@grid)) 
                while (true) do
                    if (@position.+(:x).is_available?(@grid))
                        @position.+(:x).set_occupied(@grid, @index)
                        @position.set_available(@grid)
                        @position.x += 1
                        return @position
                    end
                end
            else
                return @position
            end
    	when :W
            if (@position.-(:x).is_valid?(@grid)) 
                while (true) do
                    if (@position.-(:x).is_available?(@grid))
                        @position.-(:x).set_occupied(@grid, @index)
                        @position.set_available(@grid)                      
            		    @position.x -= 1
                        return @position
                    end
                end
            else
                return @position
            end
    	else
    		"Wrong initial direction"
    	end
    end

    def reverse
        case @direction
        when :N
            if (@position.-(:y).is_valid?(@grid)) 
                while (true) do
                    if (@position.-(:y).is_available?(@grid))                        
                        @position.-(:y).set_occupied(@grid, @index)
                        @position.set_available(@grid)
                        @position.y -= 1
                        return @position
                    end
                end
            else
                return @position
            end
        when :S
            if (@position.+(:y).is_valid?(@grid)) 
                while (true) do
                    if (@position.+(:y).is_available?(@grid))
                        @position.+(:y).set_occupied(@grid, @index)
                        @position.set_available(@grid)
                        @position.y += 1
                        return @position
                    end
                end
            else
                return @position
            end
        when :E
            if (@position.-(:x).is_valid?(@grid)) 
                while (true) do
                    if (@position.-(:x).is_available?(@grid))
                        @position.-(:x).set_occupied(@grid, @index)
                        @position.set_available(@grid)
                        @position.x -= 1
                        return @position
                    end
                end
            else
                return @position
            end
        when :W
            if (@position.+(:x).is_valid?(@grid)) 
                while (true) do
                    if (@position.+(:x).is_available?(@grid))
                        @position.+(:x).set_occupied(@grid, @index)
                        @position.set_available(@grid)
                        @position.x += 1
                        return @position
                    end
                end
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

    def stack_commands(commandList)
        location_array = Array.new
        current_position = Position.new(0,0)
        commandList.each do |item| 
            case item
            when :F
                move()
                location_array.push("#{@position.x},#{@position.y}")
            when :L 
                turn_left()
            when :R 
                turn_right()
            else
                "Wrong Command"
            end
        end
        @car_status = 0
        return location_array
    end

    def move_to_location(destination)
        location_array = Array.new
        commands = []
        position = Position.new(@position.x, @position.y)
        direction = @direction
        
        if (@car_status == 0)
            @car_status = 1
        else 
            return
        end

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

        location_array = stack_commands(commands)

    end          
end


