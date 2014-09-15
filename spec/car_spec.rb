require 'car'
require 'position'
require 'grid'
RSpec.describe Car do
    let (:grid) {Grid.new(0,50,0,50)}
    let (:x1) {3}
    let (:x2) {4}
    let (:x3) {-1}
    let (:y1) {3}
    let (:y2) {5}
    let (:y3) {-2}
    let (:positionFirst) { Position.new(x1,y1)}
    let (:positionSec) { Position.new(x2,y2)}
    let (:positionThird) { Position.new(x3,y3)} 
    let (:facingSouth) {Car.new(0, grid, positionFirst, :S)}
    let (:facingEast)  {Car.new(0, grid, positionFirst, :E)}
    let (:facingNorth)  {Car.new(0, grid, positionSec, :N)}
    let (:facingWest)  {Car.new(0, grid, positionSec, :W)}
    let (:facingWrongDirection) {Car.new(0, grid, positionFirst, :Start)}
  
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
      facingNorth.stack_commands([:F,:F,:R,:F,:L,:F])
      expect(facingNorth.position.get_coordinates).to eq([5,8])
      expect(facingNorth.direction).to eq(:N)
    end

    it 'test for serises of "move forward" commands' do
      facingSouth.stack_commands([:F,:F])
      expect(facingSouth.position.get_coordinates).to eq([3,1])
      expect(facingSouth.direction).to eq(:S)
    end

    it 'test serises of "turn" commands' do
      facingWest.stack_commands([:R,:R,:L,:L,:L])
      expect(facingWest.position.get_coordinates).to eq([4,5])
      expect(facingWest.direction).to eq(:S)
    end

    it 'test for complicated commands' do
      facingEast.stack_commands([:F,:L,:F,:L,:F,:L,:F])
      expect(facingEast.position.get_coordinates).to eq([3,3])
      expect(facingEast.direction).to eq(:S)
    end
  end

  context "Test move_to_location function" do
    let (:destination_1)  {Position.new(15,15)}
    let (:destination_2) {Position.new(1,1)}

    context 'reaching to a north-east destination' do
      it 'reaching when the car is facing north' do
        facingNorth.move_to_location(destination_1)
        expect(facingNorth.position.get_coordinates).to eq(destination_1.get_coordinates)
        expect(facingNorth.direction).to eq(:N)
      end

      it 'reaching when the car is facing south' do
        facingSouth.move_to_location(destination_1)
        expect(facingSouth.position.get_coordinates).to eq(destination_1.get_coordinates)
        expect(facingSouth.direction).to eq(:N)
      end

      it 'reaching when the car is facing east' do
        facingEast.move_to_location(destination_1)
        expect(facingEast.position.get_coordinates).to eq(destination_1.get_coordinates)
        expect(facingEast.direction).to eq(:N)
      end

      it 'reaching when the car is facing west' do
        facingWest.move_to_location(destination_1)
        expect(facingWest.position.get_coordinates).to eq(destination_1.get_coordinates)
        expect(facingWest.direction).to eq(:N)
      end
    end

    context 'reaching to a south_west destination' do
      it 'reaching when the car is facing north' do
        facingNorth.move_to_location(destination_2)
        expect(facingNorth.position.get_coordinates).to eq(destination_2.get_coordinates)
        expect(facingNorth.direction).to eq(:S)
      end

      it 'reaching when the car is facing south' do
        facingSouth.move_to_location(destination_2)
        expect(facingSouth.position.get_coordinates).to eq(destination_2.get_coordinates)
        expect(facingSouth.direction).to eq(:S)
      end

      it 'reaching when the car is facing east' do
        facingEast.move_to_location(destination_2)
        expect(facingEast.position.get_coordinates).to eq(destination_2.get_coordinates)
        expect(facingEast.direction).to eq(:S)
      end

      it 'reaching when the car is facing west' do
        facingWest.move_to_location(destination_2)
        expect(facingWest.position.get_coordinates).to eq(destination_2.get_coordinates)
        expect(facingWest.direction).to eq(:S)
      end
     end
  end

  context 'testing operation within the grid boundary 0,50,0,50' do
    let (:destination_1)  {Position.new(30,55)}
    let (:destination_2)  {Position.new(57,30)}
    let (:destination_3)  {Position.new(10,-5)}
    let (:destination_4)  {Position.new(-4,7)}
    
    it 'should return boundary max_y coordinate if the destination y coord lies off the grid' do
      facingEast.move_to_location(destination_1)
      expect(facingEast.position.get_coordinates).to eq([30,50])
    end

    it 'should return boundary max_x coordinate if the destination x coord lies off the grid' do
      facingNorth.move_to_location(destination_2)
      expect(facingNorth.position.get_coordinates).to eq([50,30])
    end

    it 'should return boundary min_y coordinate if the destination y coord lies off the grid' do
      facingWest.move_to_location(destination_3)
      expect(facingWest.position.get_coordinates).to eq([10,0])
    end

    it 'should return boundary max_x coordinate if the destination x coord lies off the grid' do
      facingSouth.move_to_location(destination_4)
      expect(facingSouth.position.get_coordinates).to eq([0,7])
    end

  end
end

