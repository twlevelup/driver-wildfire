require './lib/car'
require './lib/position'
require './lib/grid'       


class CommandOperation
  attr_accessor :car
  attr_accessor :move_command 
  attr_accessor :car_index
  def initialize(initialLocation, move_command)
    begin
       @car_index = 0
       position_direction = initialLocation.split(',')
       if position_direction.size() != 3
          raise ArgumentError, 'Please input initial location following this format (Location_X, Location_Y, Direction)'
       end
       @car = Car.new(@car_index, Grid.new(0,50,0,50), Position.new(position_direction[0].to_i, position_direction[1].to_i), position_direction[2].upcase.to_sym)
       @move_command = move_command.upcase
    end
  end
  
  def getLocation()
     @move_command.each_char.each do |c|
        if(!c.eql?("L") && !c.eql?("F") && !c.eql?("R"))
           raise ArgumentError, 'Commands must be L, F or R'
        end
     end
     car.stack_commands(@move_command.each_char.to_a.map &:to_sym)
     return "New location: (#{@car.position.x} , #{@car.position.y}), facing to #{@car.direction.to_s}" 
  end
end