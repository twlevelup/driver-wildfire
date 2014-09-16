require './lib/car'
require './lib/grid'
require './lib/position'

class System

<<<<<<< HEAD
  def show_menu
     begin

      grid = nil
      taxi_list = Array.new
      taxi_index = 0
      taxi = nil

      while true
        puts "Please input the commands..."
        msg = gets.chomp
        case msg 
          when "exit"
            puts 'The system has been shut down.'
            exit
          when "help"
            puts "Basic Commands: createtaxi"
            puts "                destination"
            puts "                creatgrid"
            puts "                taxi"
            puts "                givecommand"
          when "createtaxi"
            puts "Please define the arguments for taxi (x,y,direction)..."
            initial_arguments = gets.chomp.split(',')
            validate_inputs(initial_arguments)
            taxi = Car.new(taxi_index,grid,Position.new(initial_arguments[0].to_i,initial_arguments[1].to_i),initial_arguments[2].upcase.to_sym)
            puts "Taxi #{taxi_index} has been created successfully."
            puts "Taxi #{taxi.index} : #{taxi.position.x} , #{taxi.position.y}  "
            taxi_list << taxi
            taxi_index += 1
          when "creategrid"
            puts "Please input the arguments for grid"
            grid_arguments = gets.chomp().split(',')
            grid = Grid.new(grid_arguments[0].to_i,grid_arguments[1].to_i,grid_arguments[2].to_i,grid_arguments[3].to_i)
            grid.print_grid
            puts "Grid has been successfully created #{}"
          when "taxishow"
            taxi_list.each do |item|
              puts "taxi: #{item.index}"
            end
          when "showgrid"
            grid.print_grid
        end
=======
  grid = Grid.new(0,50,0,50)
  visual_grid = Grid.new(0,50,0,50)
  taxi_list = Array.new
  taxi_index = 1
  taxi = nil
  
  destination = Position.new(0,0)
  location_array = Array.new
  temp_location = Position.new(0,0)

  while true
    tag = true
    puts "Please input the commands..."
    msg = gets.chomp
    case msg 
      when "exit"
        puts 'The system has been shut down.'
        exit
      when "help"
        puts "Basic Commands: create_taxi"
        puts "                destination"
        puts "                create_grid"
        puts "                taxi"
        puts "                givecommand"
      when "createtaxi"
        while (tag == true)
          puts "Please define the arguments for taxi (x,y,direction)..."
          initial_arguments = gets.chomp.split(',')
          position = Position.new(initial_arguments[0].to_i,initial_arguments[1].to_i)

          if(position.is_valid?(grid) && position.is_available?(grid))
              taxi = Car.new(taxi_index, grid, position, initial_arguments[2].upcase.to_sym)
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
        
      when "creategrid"
        puts "Please input the arguments for grid"
        grid_arguments = gets.chomp().split(',')
        grid = Grid.new(grid_arguments[0].to_i,grid_arguments[1].to_i,grid_arguments[2].to_i,grid_arguments[3].to_i)
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
>>>>>>> 2b2e75d00210a05790719f7247a13062df038025


      end

    rescue ArgumentError => e
      puts e.message
      show_menu
    end    
  end
  
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
