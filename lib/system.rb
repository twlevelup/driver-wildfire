require './car'
require './grid'
require './position'

begin

  grid = Grid.new(0,50,0,50)
  taxi_list = Array.new
  taxi_index = 0
  taxi = nil
  
  
  while true
    tag = true
    puts "Please input the commands..."
    msg = gets.chomp
    case msg 
      when "exit"
        raise ArgumentError, 'The system has been shut down.'
      when "help"
        puts "Basic Commands: createtaxi"
        puts "                destination"
        puts "                creatgrid"
        puts "                taxi"
        puts "                givecommand"
      when "createtaxi"
        while (tag == true)
          puts "Please define the arguments for taxi (x,y,direction)..."
          initial_arguments = gets.chomp.split(',')
          position = Position.new(initial_arguments[0].to_i,initial_arguments[1].to_i)

          if(position.is_available?(grid))
              taxi = Car.new(taxi_index, grid, position, initial_arguments[2].upcase.to_sym)
              puts "Taxi #{taxi_index} has been created successfully."
              puts "Taxi #{taxi.index} : #{taxi.position.x} , #{taxi.position.y}  "
              taxi_list << taxi
              taxi_index += 1
              position.set_occupied(grid, taxi_index)
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
        grid.print_grid
    end


  end

rescue ArgumentError => e
  puts e.message

end