require 'colorize'
require 'win32console' if RUBY_PLATFORM =~ /i386-mingw32/
require_relative 'car'
require_relative 'grid'
require_relative 'position'
require_relative 'CommandOperation'


#class System
begin
	grid = nil
	visual_grid = nil
	# grid = Grid.new(0,50,0,50)
	# visual_grid = Grid.new(0,50,0,50)
	taxi_list = Array.new
	taxi_index = 1
	taxi = nil
	
	destination = Position.new(0,0)
	location_array = Array.new
	temp_location = Position.new(0,0)
	command_filter = CommandOperation.new
	
	system "cls"

	while true
		tag = true
		puts "======================================================".yellow.on_red
		puts "       WILDFIRE AUTOMATED TAXI SERVICE                ".blue.on_red.blink
		puts "======================================================".yellow.on_red
		puts "       OPTIONS".cyan
		puts "       1. create_grid".blue
		puts "       2. create_taxi".blue
		puts "       3. move_taxi".light_blue
		puts "       4. show_path".magenta
		puts "       5. show_grid".magenta
		puts "       6. view_taxies".magenta
		puts "       7. help".yellow
		puts "       8. exit".yellow
		puts "                                                      ".on_red
		puts "Please enter a command from the options..."
		msg = gets.chomp
		case msg 
			when "exit"
				puts 'The system has been shut down.'
				exit
			when "help"
				puts "The most commonly Basic Commands are:".colorize(:blue)
				puts "  create_grid       add a grid for the system, define the boundary of movement.".green
				puts "  create_taxi       add a taxi to the system, the system will automatically\n                    generate an index for the taxi.".green
				puts "  show_grid         show taxis' locations and their index number on the grid.".green
				puts "  show_path         show the path of the taxi move to the destination.".green
				puts "  view_taxies       show the list of current_taxi and their status, location,\n                    ID and facing direction.".green
				puts "  move_taxi         move a taxi to another location.".green
        puts 'Press "Enter" to continue... '
        gets.chomp()
			when "create_taxi"
				while (tag == true)
					puts "Please define the arguments for taxi (x,y,direction)..."
					initial_arguments = gets.chomp
					
					while (!command_filter.create_taxi_command_is_valid?(initial_arguments))
						initial_arguments = gets.chomp
					end
					taxi_arguments = initial_arguments.split(',')
					position = Position.new(taxi_arguments[0].to_i,taxi_arguments[1].to_i)

					if(position.is_valid?(grid) && position.is_available?(grid))
							taxi = Car.new(taxi_index, grid, position, taxi_arguments[2].upcase.to_sym)
							puts "Taxi #{taxi_index} has been created successfully."
							puts "Taxi #{taxi.index} : #{taxi.position.x} , #{taxi.position.y}  "
							taxi_list << taxi
							position.set_occupied(grid, taxi_index)
							position.set_occupied(visual_grid, taxi_index)
							taxi_index += 1              
							tag = false
					else
						puts "The taxi lacation is already been taken... Please give another location"
							tag = true
					end
          puts'Press "Enter" to continue... '
          gets.chomp()
				end
				
			when "create_grid"
				puts "Please input the arguments for grid as the format(x_min,x_max,y_min,y_max)... eg.(0,30,0,30)"
				grid_command = gets.chomp()
				while !command_filter.create_grid_command_is_valid?(grid_command)
					grid_command = gets.chomp()
				end
				grid_arguments = grid_command.split(',')
				grid = Grid.new(grid_arguments[0].to_i,grid_arguments[1].to_i,grid_arguments[2].to_i,grid_arguments[3].to_i)
				visual_grid = Grid.new(grid_arguments[0].to_i,grid_arguments[1].to_i,grid_arguments[2].to_i,grid_arguments[3].to_i)
				grid.print_grid
				puts "Grid has been successfully created."
        puts'Press "Enter" to continue... '
        gets.chomp()
			when "view_taxies"
				puts "\tTAXI NUMBER\tPOSITION [X,Y]\t\tDIRECTION\tSTATUS"
				puts "\t===========\t==============\t\t=========\t======"
				puts
				taxi_list.each do |item|
					if (item.car_status == 0)
						tx_status = "Available"
					else
						tx_status = "Not available"
					end
					puts "\tTaxi #{item.index}\t\t[#{item.position.x}, #{item.position.y}]\t\t\t#{item.direction}\t\t#{tx_status}"
				end
        puts'Press "Enter" to continue... '
        gets.chomp()
			when "show_grid"
				puts "Grid STATUS:"
        grid.print_grid
        puts'Press "Enter" to continue... '
        gets.chomp()
			when "show_path"
        puts "Visual Path"
        visual_grid.print_grid
        puts'Press "Enter" to continue... ' 
        gets.chomp()
      when "move_taxi"
				puts "Please input the taxi number : "
				taxi_number = gets.chomp().to_i;
        current_taxi = taxi_list[taxi_number-1]
				puts "Please enter the destination... eg.(10,15)\n Now the taxi is at [#{current_taxi.position.x},#{current_taxi.position.y}]"
				dest = gets.chomp().split(',')
				destination.set_coordinates(dest[0].to_i,dest[1].to_i)
				
				puts "The locations passes by the car : "
				puts "[#{current_taxi.position.x},#{current_taxi.position.y}]"
				
				location_array.clear
				location_array = current_taxi.move_to_location(destination)
			 
				location_array.each do |item| 
					item = item.split(',')
					puts "[#{item[0].to_i},#{item[1].to_i}]"
					temp_location.set_coordinates(item[0].to_i, item[1].to_i)
					temp_location.set_occupied(visual_grid, taxi_number)
				end
        puts'Press "Enter" to continue... '
        gets.chomp()
			else
				puts "Wrong Command..."
		end
  end
end
