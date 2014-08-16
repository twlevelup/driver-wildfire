require 'car'

RSpec.describe Car do
  it "should honk" do
    d = Car.new(0,0,:N)
    expect(d.honk).to eq('honk honk toot toot beep beep')
  end

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

  it "should return \"Wrong initial direction\" when a direction is given other than North, South, East, West" do
    d = Car.new(6,7,"NorthEast")
    expect(d.move).to eq("Wrong initial direction")
  end

  it "should return \"Invalid Starting Position\" when a position is given with negative x or y" do
    d = Car.new(-1,-2,"North")
    expect(d.move).to eq("Invalid Starting Position")
  end

  it 'should return "W" when the car is facing North then do a leftturn' do
    car = Car.new(0,0,:N)
    result = car.left_turn
    expect(result).to eq("W")
  end

  it 'should return "E" when the car is facing South then do a leftturn' do
    car = Car.new(1,1,:S)
    expect(car.left_turn).to eq("E")
  end

  it 'should return "N" when the car is facing East then do a leftturn' do
    car = Car.new(1,2,:E)
    expect(car.left_turn).to eq("N")
  end

  it 'should return "S" when the car is facing West then do a leftturn' do
    car = Car.new(2,3,:W)
    expect(car.left_turn).to eq("S")
  end

  it 'should return "Wrong initial direction" when the car is facing an unclear direction (expect for :N,:S,:W,:E)' do
    car = Car.new(3,1,:Start)
    expect(car.left_turn).to eq("Wrong initial direction")
  end

    it 'should return "W" when the car is facing North then do a leftturn' do
    car = Car.new(0,0,:N)
    result = car.left_turn
    expect(result).to eq("W")
  end

  it 'should return "E" when the car is facing South then do a leftturn' do
    car = Car.new(1,1,:S)
    expect(car.left_turn).to eq("E")
  end

  it 'should return "N" when the car is facing East then do a leftturn' do
    car = Car.new(1,2,:E)
    expect(car.left_turn).to eq("N")
  end

  it 'should return "S" when the car is facing West then do a leftturn' do
    car = Car.new(2,3,:W)
    expect(car.left_turn).to eq("S")
  end

  it 'should return "E" when the car is facing North then do a rightturn' do
    car = Car.new(0,0,:N)
    expect(car.right_turn).to eq("E")
  end

  it 'should return "S" when the car is facing East then do a rightturn' do
    car = Car.new(0,0,:E)
    expect(car.right_turn).to eq("S")
  end

  it 'should return "W" when the car is facing South then do a rightturn' do
    car = Car.new(0,0,:S)
    expect(car.right_turn).to eq("W")
  end

  it 'should return "N" when the car is facing West then do a rightturn' do
    car = Car.new(0,0,:W)
    expect(car.right_turn).to eq("N")
  end

  it 'should return "Wrong initial direction" when the car is facing  unclear direction then do a rightturn' do
    car = Car.new(0,0,:Start)
    expect(car.right_turn).to eq("Wrong initial direction")
  end

  it 'return "N" when the car facing North' do
    car = Car.new(0,0,:N)
    expect(car.direction).to eq(:N)
  end

  it 'return "S" when the car facing South' do
    car = Car.new(0,0,:S)
    expect(car.direction).to eq(:S)
  end

  it 'return "E" when the car facing East' do
    car = Car.new(0,0,:E)
    expect(car.direction).to eq(:E)
  end

  it 'return "W" when the car facing West' do
    car = Car.new(0,0,:W)
    expect(car.direction).to eq(:W)
  end

  it 'return "Wrong initial direction" when the car facing unclear direction' do
    car = Car.new(0,0,:Start)
    expect(car.direction).to eq("Wrong initial direction")
  end

  it 'return "N" when the car facing West then do a rightturn' do
    car = Car.new(0,2,:W)
    car.right_turn()
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

   it 'return [0,1] when the car at the position [1,1] and facing North then turnleft then move forward for one block' do
    car =Car.new(1,1,:N)
    car.left_turn()
    car.move()
    expect(car.position).to eq([0,1])
  end
end
