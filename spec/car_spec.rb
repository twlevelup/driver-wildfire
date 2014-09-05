require 'car'
require 'position'
RSpec.describe Car do
    let(:x1) {0}
    let(:x2) {4}
    let(:x3) {-1}
    let(:y1) {0}
    let(:y2) {5}
    let(:y3) {-2}
    let (:positionFirst) { Position.new(x1,y1)}
    let (:positionSec) { Position.new(x2,y2)}
    let (:positionThird) { Position.new(x3,y3)} 
    let (:facingSouth) {Car.new(positionFirst,:S)}
    let (:facingEast)  {Car.new(positionFirst,:E)}
    let (:facingNorth)  {Car.new(positionSec,:N)}
    let (:facingWest)  {Car.new(positionSec,:W)}
    let (:facingWrongDirection) {Car.new(positionFirst,:Start)}
  
  describe "Test move function" do
    it "facing north" do
      facingNorth.move
      expect(facingNorth.position.x).to eq(x2)
      expect(facingNorth.position.y).to eq(y2+1)
    end

    it "facing south" do 
      facingSouth.move
      expect(facingSouth.position.x).to eq(x1)
      expect(facingSouth.position.y).to eq(y1-1)
    end

    it "facing east" do 
      facingEast.move
      expect(facingEast.position.x).to eq(x1+1)
      expect(facingEast.position.y).to eq(y1)
    end

    it "facing west" do
      facingWest.move
      expect(facingWest.position.x).to eq(x2-1)
      expect(facingWest.position.y).to eq(y2)
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
      expect(facingWest.position.x).to eq(positionSec.x)
      expect(facingWest.position.y).to eq(positionSec.y)
    end

    it "when direction is not valid" do
      expect(facingWrongDirection.direction).to eq("Wrong initial direction")
    end
  end

  describe "test for stack commands function" do

    it 'do series commands' do
      facingNorth.stackCommands([:F,:F,:R,:F,:L,:F])
      expect([facingNorth.position.x,facingNorth.position.y]).to eq([5,8])
      expect(facingNorth.direction).to eq(:N)
    end

    it 'test for serises of "move forward" commands' do
      facingSouth.stackCommands([:F,:F])
      expect([facingSouth.position.x,facingSouth.position.y]).to eq([0,-2])
      expect(facingSouth.direction).to eq(:S)
    end

    it 'test serises of "turn" commands' do
      facingWest.stackCommands([:R,:R,:L,:L,:L])
      expect([facingWest.position.x,facingWest.position.y]).to eq([4,5])
      expect(facingWest.direction).to eq(:S)
    end

    it 'test for complicated commands' do
      facingEast.stackCommands([:F,:L,:F,:L,:F,:L,:F])
      expect([facingEast.position.x,facingEast.position.y]).to eq([0,0])
      expect(facingEast.direction).to eq(:S)
    end
  end
end
