       


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
end