require 'car'
require 'position'
require 'grid'
RSpec.describe Car do
    let (:grid) {Grid.new(0,50,0,50)}
    let (:x1) {0}
    let (:x2) {4}
    let (:x3) {-1}
    let (:y1) {0}
    let (:y2) {5}
    let (:y3) {-2}
    let (:positionFirst) { Position.new(x1,y1)}
    let (:positionSec) { Position.new(x2,y2)}
    let (:positionThird) { Position.new(x3,y3)} 
    let (:facingSouth) {Car.new(grid, positionFirst, :S)}
    let (:facingEast)  {Car.new(grid, positionFirst, :E)}
    let (:facingNorth)  {Car.new(grid, positionSec, :N)}
    let (:facingWest)  {Car.new(grid, positionSec, :W)}
    let (:facingWrongDirection) {Car.new(grid, positionFirst, :Start)}
  
  describe "Test move function" do
    it "facing north" do
      facingNorth.move
      expect(facingNorth.position.get_coordinates).to eq([x2, y2+1])
    end

    it "facing south" do 
      facingSouth.move
      expect(facingSouth.position.get_coordinates).to eq([x1, y1-1])
    end

    it "facing east" do 
      facingEast.move
      expect(facingEast.position.get_coordinates).to eq([x1+1, y1])
    end

    it "facing west" do
      facingWest.move
      expect(facingWest.position.get_coordinates).to eq([x2-1,y2])
    end
  end


  describe "Test turn left function" do
    it "facing north" do
      facingNorth.turn_left
      expect(facingNorth.direction).to eq(:W)
    end

    it "facing south" do
      facingSouth.turn_left
      expect(facingSouth.direction).to eq(:E)
    end

    it "facing west" do
      facingWest.turn_left
      expect(facingWest.direction).to eq(:S)
    end

    it "facing east" do
      facingEast.turn_left
      expect(facingEast.direction).to eq(:N)
    end

    it "facing wrong direction" do
      facingWrongDirection.turn_left
      expect(facingWrongDirection.direction).to eq("Wrong initial direction")
    end
  end

  describe "Test turn right function" do
    it "facing north" do
      facingNorth.turn_right
      expect(facingNorth.direction).to eq(:E)
    end

    it "facing south" do
      facingSouth.turn_right
      expect(facingSouth.direction).to eq(:W)
    end

    it "facing west" do
      facingWest.turn_right
      expect(facingWest.direction).to eq(:N)
    end

    it "facing east" do
      facingEast.turn_right
      expect(facingEast.direction).to eq(:S)
    end

    it "facing wrong direction" do
      facingWrongDirection.turn_left
      expect(facingWrongDirection.direction).to eq("Wrong initial direction")
    end
  end

  describe "Test get direction function and get location function" do 
    it "return correct direction" do
      expect(facingWest.direction).to eq(:W)
      expect(facingEast.direction).to eq(:E)
      expect(facingSouth.direction).to eq(:S)
      expect(facingNorth.direction).to eq(:N)
    end

    it "return correct location" do
      expect(facingWest.position.get_coordinates).to eq(positionSec.get_coordinates)
    end

    it "when direction is not valid" do
      expect(facingWrongDirection.direction).to eq("Wrong initial direction")
    end
  end

  describe "test for stack commands function" do

    it 'do series commands' do
      facingNorth.stackCommands([:F,:F,:R,:F,:L,:F])
      expect(facingNorth.position.get_coordinates).to eq([5,8])
      expect(facingNorth.direction).to eq(:N)
    end

    it 'test for serises of "move forward" commands' do
      facingSouth.stackCommands([:F,:F])
      expect(facingSouth.position.get_coordinates).to eq([0,-2])
      expect(facingSouth.direction).to eq(:S)
    end

    it 'test serises of "turn" commands' do
      facingWest.stackCommands([:R,:R,:L,:L,:L])
      expect(facingWest.position.get_coordinates).to eq([4,5])
      expect(facingWest.direction).to eq(:S)
    end

    it 'test for complicated commands' do
      facingEast.stackCommands([:F,:L,:F,:L,:F,:L,:F])
      expect(facingEast.position.get_coordinates).to eq([0,0])
      expect(facingEast.direction).to eq(:S)
    end
  end


end
