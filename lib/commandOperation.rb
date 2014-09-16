require './lib/car'
require './lib/position'
require './lib/grid'       


class CommandOperation
  attr_accessor :car
  attr_accessor :move_commands
  attr_accessor :car_index
  def initialize(initial_arguments, move_commands)
    @car_index = 0
    @car = Car.new(@car_index, Grid.new(0,50,0,50), Position.new(initial_arguments[0].to_i, initial_arguments[1].to_i), initial_arguments[2].upcase.to_sym)
    @move_commands = move_commands.upcase
  end
  
  def get_location()
     
     car.stack_commands(@move_commands.each_char.to_a.map &:to_sym)
     return "New location: (#{@car.position.x} , #{@car.position.y}), facing to #{@car.direction.to_s}" 
  end
end