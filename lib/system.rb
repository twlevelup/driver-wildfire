require './car'
require './grid'
require './position'

begin

  grid = Grid.new(0,50,0,50)
  taxi_list = Array.new
  taxi_index = 1
  taxi = nil
  
  
  while true
    tag = true
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
        grid.print_grid
      when "move_to"
        puts "Please input the taxi number : "
        number = gets.chomp().to_i;
        puts "Please enter the destination... eg.(10,15)"
        dest = gets.chomp().split(',')
        destination = Position.new(dest[0].to_i,dest[1].to_i)
        current_taxi = taxi_list[number-1]
        puts "[#{current_taxi.position.x},#{current_taxi.position.y}]"
        current_taxi.move_to_location(destination)
      end


  end

rescue ArgumentError => e
  puts e.message

end