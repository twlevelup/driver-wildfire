require 'car'

RSpec.describe Car do
  it "should honk" do
  	d = Car.new(0,0,"North")
    expect(d.honk).to eq('honk honk toot toot beep beep')
  end

  it "should move north by one" do
  	d = Car.new(0,0,"North")
  	expect(d.move).to eq([0,1])
  end

  it "should move south by one" do
  	d = Car.new(0,0,"South")
  	expect(d.move).to eq([0,-1])
  end

  it "should move east by one" do
  	d = Car.new(0,0,"East")
  	expect(d.move).to eq([1,0])
  end

  it "should move west by one" do
  	d = Car.new(0,0,"West")
  	expect(d.move).to eq([-1,0])
  end

  it "should return position [12,6] when moves north starts from [12,5]" do
  	d = Car.new(12,5,"North")
  	expect(d.move).to eq([12,6])
  end

  it "should return position [5,3] when moves south and starts from [5,4]" do
  	d = Car.new(5,4,"South")
  	expect(d.move).to eq([5,3])
  end

  it "should return position [11,3] when moves east starts from [10,3]" do
  	d = Car.new(10,3,"East")
  	expect(d.move).to eq([11,3])
  end

  it "should return position [5,7] when moves west starts from [6,7]" do
  	d = Car.new(6,7,"West")
  	expect(d.move).to eq([5,7])
  end

  it "should return \"Wrong Direction\" when a direction is given other than North, South, East, West" do
  	d = Car.new(6,7,"NorthEast")
  	expect(d.move).to eq("Wrong Direction")
  end

  it "should return \"Invalid Starting Position\" when a position is given with negative x or y" do
  	d = Car.new(-1,-2,"North")
  	expect(d.move).to eq("Invalid Starting Position")
  end


end
