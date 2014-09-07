require './lib/car'
require './lib/position'      

class CommandOperation
  attr_accessor :car
  attr_accessor :moveCommand 
  def initialize(initialLocation, moveCommand)
    begin
       positionDirection = initialLocation.split(',')
       if positionDirection.size() != 3
          raise ArgumentError, 'Please input initial location following this format (Location_X, Location_Y, Direction)'
       end
       @car = Car.new(Position.new(positionDirection[0].to_i, positionDirection[1].to_i), positionDirection[2].to_sym)
       @moveCommand = moveCommand
    end
  end
  
  def getLocation()
     car.stackCommands(@moveCommand.each_char.to_a.map &:to_sym)
     return "New location: (#{@car.position.x} , #{@car.position.y}), facing to #{@car.direction.to_s}" 
  end
end