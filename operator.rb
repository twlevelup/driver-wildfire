require './lib/commandOperation'

begin
  
  if ARGV.size() != 2
  	#puts "#{ARGV.size()}"
    raise ArgumentError, 'Please input 2 arguments!'
  end
  
  origin_initial_arguments = ARGV[0].split(',')
  origin_move_commands = ARGV[1]
  car_initial_arguments = nil
  car_move_commands = nil

  if origin_initial_arguments.size() != 3
    raise ArgumentError, 'Please input initial location following this format (Location_X, Location_Y, Direction)'
  end

  # match the input arguments with a nondigit: /[^0-9]/
  if ((origin_initial_arguments[0] =~/\D/) || (origin_initial_arguments[1] =~/\D/))
    raise ArgumentError, 'The position arguments must be integer'
  else car_initial_arguments = origin_initial_arguments
  end

  # limit the move commands to F,R,L
  if origin_move_commands =~ /[^FfLlRr]/
    raise ArgumentError, 'Move commands must be L, F or R'
  else car_move_commands = origin_move_commands
  end

  #grid_initial = ARGV[3]
  #ToDo

  #destination = ARGV[4]

  command_operation = CommandOperation.new(car_initial_arguments, car_move_commands)
  puts command_operation.get_location()
  rescue ArgumentError => e
    puts e.message
end           