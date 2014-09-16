class CommandOperation
  
  def initialize()
    
  end
  
  def create_taxi_command_is_valid?(commands)
 
    initial_arguments = commands.split(",")
    if initial_arguments.size() != 3
      puts "Please input the correct number of arguments"
      return false
    elsif (initial_arguments[0] =~/\D/ || initial_arguments[1] =~/\D/)
      puts "The location arguments just can be integer."
      return false
    elsif initial_arguments[2] =~ /[^ESWNeswn]/
      puts "The direciton arguments just can be N,S,W,E"
      return false
    else
      return true
    end
  end

  def create_grid_command_is_valid?(commands)
    arguments = commands.split(",")
    if arguments.size() != 4
      puts "Please input the correct number of arguments"
      return false
    elsif arguments[0] =~ /\D/ || arguments[1] =~ /\D/ || arguments[2] =~ /\D/ ||arguments[3] =~ /\D/
      puts "the arguments just can be integers"
      return false
    elsif arguments[0] > arguments[1] || arguments[2] > arguments[3]
      puts "x_max should biger than x_min and y_max should biger than y_min"
      return false
    else
      return true
    end
  end
end