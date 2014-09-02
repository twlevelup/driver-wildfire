require 'car'

def getCar(x, y, direction)
  Car.new(x, y, direction)
end

RSpec.describe Car do
  it "should move north by one" do
    d = Car.new(0,0,:N)
  	expect(d.move).to eq([0,1])
  end

  it "should move south by one" do
    d = Car.new(0,0,:S)
    expect(d.move).to eq([0,-1])
  end

  it "should move east by one" do
    d = Car.new(0,0,:E)
    expect(d.move).to eq([1,0])
  end

  it "should move west by one" do
    d = Car.new(0,0,:W)
    expect(d.move).to eq([-1,0])
  end

  it "should return position [12,6] when moves north starts from [12,5]" do
    d = Car.new(12,5,:N)
    expect(d.move).to eq([12,6])
  end

  it "should return position [5,3] when moves south and starts from [5,4]" do
    d = Car.new(5,4,:S)
    expect(d.move).to eq([5,3])
  end

  it "should return position [11,3] when moves east starts from [10,3]" do
    d = Car.new(10,3,:E)
    expect(d.move).to eq([11,3])
  end

  it "should return position [5,7] when moves west starts from [6,7]" do
    d = Car.new(6,7,:W)
    expect(d.move).to eq([5,7])
  end

  it 'should return :W when the car is facing North then do a left turn' do
    car = Car.new(0,0,:N)
    car.turn_left
    expect(car.direction).to eq(:W)
  end

  it 'should return [0,0] when the car is facing North then do a left turn' do
    car = Car.new(0,0,:N)
    car.turn_left
    expect(car.position).to eq([0,0])
  end

  it 'should return :E when the car is facing South then do a left turn' do
    car = Car.new(1,1,:S)
    expect(car.turn_left).to eq(:E)
  end

  it 'should return :N when the car is facing East then do a left turn' do
    car = Car.new(1,2,:E)
    expect(car.turn_left).to eq(:N)
  end

  it 'should return :S when the car is facing West then do a left turn' do
    car = Car.new(2,3,:W)
    expect(car.turn_left).to eq(:S)
  end

  it 'should return "Wrong initial direction" when the car is facing an unclear direction (expect for :N,:S,:W,:E)' do
    car = Car.new(3,1,:Start)
    expect(car.turn_left).to eq("Wrong initial direction")
  end

  it 'should return :E when the car is facing North then do a right turn' do
    car = Car.new(0,0,:N)
    expect(car.turn_right).to eq(:E)
  end

  it 'should return :S when the car is facing East then do a right turn' do
    car = Car.new(0,0,:E)
    expect(car.turn_right).to eq(:S)
  end

  it 'should return :W when the car is facing South then do a right turn' do
    car = Car.new(0,0,:S)
    expect(car.turn_right).to eq(:W)
  end

  it 'should return :N when the car is facing West then do a right turn' do
    car = Car.new(0,0,:W)
    expect(car.turn_right).to eq(:N)
  end

  it 'should return "Wrong initial direction" when the car is facing  unclear direction then do a right turn' do
    car = Car.new(0,0,:Start)
    expect(car.turn_right).to eq("Wrong initial direction")
  end

  it 'return :N when the car facing North' do
    car = Car.new(0,0,:N)
    expect(car.direction).to eq(:N)
  end

  it 'return :S when the car facing South' do
    car = Car.new(0,0,:S)
    expect(car.direction).to eq(:S)
  end

  it 'return :E when the car facing East' do
    car = Car.new(0,0,:E)
    expect(car.direction).to eq(:E)
  end

  it 'return :W when the car facing West' do
    car = Car.new(0,0,:W)
    expect(car.direction).to eq(:W)
  end

  it 'return [2,3],:N when the car is at position [2,3] facing North and position and direction is requested' do
    car = Car.new(2,3,:N)
    expect(car.position).to eq([2,3])
    expect(car.direction).to eq(:N)
  end

  it 'return "Wrong initial direction" when the car facing unclear direction' do
    car = Car.new(0,0,:Start)
    expect(car.direction).to eq("Wrong initial direction")
  end

  it 'return :N when the car facing West then do a right turn' do
    car = Car.new(0,2,:W)
    car.turn_right()
    expect(car.direction).to eq(:N)
  end

  it 'return [2,1] when the car at the position [1,1] and facing East and move forward for one block' do
    car =Car.new(1,1,:E)
    car.move()
    expect(car.position).to eq([2,1])
  end

  it 'return [1,2] when the car at the position [1,1] and facing North and move forward for one block' do
    car =Car.new(1,1,:N)
    car.move()
    expect(car.position).to eq([1,2])
  end

  it 'return [0,1] when the car at the position [1,1] and facing West and move forward for one block' do
    car =Car.new(1,1,:W)
    car.move()
    expect(car.position).to eq([0,1])
  end

  it 'return [1,0] when the car at the position [1,1] and facing South and move forward for one block' do
    car =Car.new(1,1,:S)
    car.move()
    expect(car.position).to eq([1,0])
  end

  it 'return [0,1],:W starting from [1,1] facing North then turn left and then move one block forward' do
    car =Car.new(1,1,:N)
    car.turn_left()
    car.move()
    expect(car.position).to eq([0,1])
    expect(car.direction).to eq(:W)
  end

  it 'should return [2,4],:N starting from [2,3] facing East then turn left and then move one block forward' do
    car =Car.new(2,3,:E)
    car.turn_left()
    car.move()
    expect(car.position).to eq([2,4])
    expect(car.direction).to eq(:N)
  end

  it 'should return [4,3],:E starting from [3,3] facing South then turn left and then move one block forward' do
    car =Car.new(3,3,:S)
    car.turn_left()
    car.move()
    expect(car.position).to eq([4,3])
    expect(car.direction).to eq(:E)
  end

  it 'should return [2,1],:S starting from [2,2] facing West then turn left and then move one block forward' do
    car =Car.new(2,2,:W)
    car.turn_left()
    car.move()
    expect(car.position).to eq([2,1])
    expect(car.direction).to eq(:S)
  end

  it 'should return [1,2],:W starting from [1,1] facing North then move one block forward and then turn left' do
    car =Car.new(1,1,:N)
    car.move()
    car.turn_left()
    expect(car.position).to eq([1,2])
    expect(car.direction).to eq(:W)
  end

  it 'should return [1,3],:N starting from [1,2] facing East then move one block forward and then turn left' do
    car =Car.new(1,2,:E)
    car.move()
    car.turn_left()
    expect(car.position).to eq([2,2])
    expect(car.direction).to eq(:N)
  end

  it 'should return [3,1],:E starting from [3,2] facing South then move one block forward and then turn left' do
    car =Car.new(3,2,:S)
    car.move()
    car.turn_left()
    expect(car.position).to eq([3,1])
    expect(car.direction).to eq(:E)
  end

  it 'should return [3,3],:S starting from [4,3] facing West then move one block forward and then turn left' do
    car =Car.new(4,3,:W)
    car.move()
    car.turn_left()
    expect(car.position).to eq([3,3])
    expect(car.direction).to eq(:S)
  end

  it 'should return [2,1],:E starting from [1,1] facing North then turn right and then move one block forward' do
    car =Car.new(1,1,:N)
    car.turn_right()
    car.move()
    expect(car.position).to eq([2,1])
    expect(car.direction).to eq(:E)
  end

  it 'should return [7,3],:S starting from [7,4] facing East then turn right and then move one block forward' do
    car =Car.new(7,4,:E)
    car.turn_right()
    car.move()
    expect(car.position).to eq([7,3])
    expect(car.direction).to eq(:S)
  end

  it 'should return [4,4],:W starting from [5,4] facing South then turn right and then move one block forward' do
    car =Car.new(5,4,:S)
    car.turn_right()
    car.move()
    expect(car.position).to eq([4,4])
    expect(car.direction).to eq(:W)
  end

  it 'should return [4,5],:N starting from [4,4] facing West then turn right and then move one block forward' do
    car =Car.new(4,4,:W)
    car.turn_right()
    car.move()
    expect(car.position).to eq([4,5])
    expect(car.direction).to eq(:N)
  end

  context "test for stack commands" do

   it 'do series commands' do
      car = Car.new(0,0,:N)
      car.stackCommands([:F,:F,:R,:F,:L,:F])
      expect(car.position).to eq([1,3])
      expect(car.direction).to eq(:N)
    end

    it 'test for serises of "move forward" commands' do
      car = Car.new(0,0,:N)
      car.stackCommands([:F,:F])
      expect(car.position).to eq([0,2])
      expect(car.direction).to eq(:N)
    end

    it 'should return (0,0,S) starting from (0,0,N) giving [R,R]' do
    car = Car.new(0,0,:N)
       car.stackCommands([:R,:R])
      expect(car.position).to eq([0,0])
      expect(car.direction).to eq(:S)
    end

     it 'should return (4,5,E) starting from (4,5,S) giving [F,L,F,L,F,L,F]' do
      car = Car.new(4,5,:E)
      car.stackCommands([:F,:L,:F,:L,:F,:L,:F])
      expect(car.position).to eq([4,5])
      expect(car.direction).to eq(:S)
    end
  end
end
