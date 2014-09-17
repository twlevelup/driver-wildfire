
require './car'
require './grid'
require './position'
require './colors'
require './CommandOperation'


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
  
  while true
    tag = true
    puts "Please input the commands..."
    msg = gets.chomp
    case msg 
      when "exit"
        puts 'The system has been shut down.'
        exit
      when "help"
        puts "The most commonly Basic Commands are:"
        puts "  create_grid       add a grid for the system, define the boundary of movement."
        puts "  create_taxi       add a taxi to the system, the system will automatically generate an index for the taxi."
        puts "  show_grid         show taxis' locations and their index number on the grid."
        puts "  show_path         show the path of the taxi move to the destination."
        puts "  show_taxi         show the list of current_taxi and their status, location, ID and facing direction."
        puts "  move_taxi         move a taxi to another location."
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
        puts "Grid has been successfully created #{}"
      when "taxishow"
        taxi_list.each do |item|
          puts "taxi: #{item.index}"
        end
      when "showgrid"
        #grid.print_grid
        puts "Visual Grid"
        visual_grid.print_grid
      when "move_to"
        puts "Please input the taxi number : "
        taxi_number = gets.chomp().to_i;
        puts "Please enter the destination... eg.(10,15)"
        dest = gets.chomp().split(',')
        destination.set_coordinates(dest[0].to_i,dest[1].to_i)
        current_taxi = taxi_list[taxi_number-1]

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
    end
end

    rescue ArgumentError => e
      puts e.message
      show_menu
    end    
  #end
=begin  
  def validate_inputs(inputs)
    begin

      if inputs.size() != 3
        raise ArgumentError, 'Please input initial location following this format (Location_X, Location_Y, Direction)'
      end

      # match the input arguments with a nondigit: /[^0-9]/
      if ((inputs[0] =~/\D/) || (inputs[1] =~/\D/))
        raise ArgumentError, 'The position arguments must be integer'
      end
      
    end
  end       
end 
=end
