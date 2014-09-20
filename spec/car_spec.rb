require_relative 'spec_helper'

RSpec.describe Car do
    let (:grid) {Grid.new(0,50,0,50)}
    let (:car_0) {Car.new(0, grid, Position.new(4,4), :N)}
    let (:car_1) {Car.new(1, grid, Position.new(4,4), :N)}
    let (:x1) {3}
    let (:x2) {4}
    let (:x3) {-1}
    let (:y1) {3}
    let (:y2) {5}
    let (:y3) {-2}
    let (:position_first) { Position.new(x1,y1)}
    let (:position_sec) { Position.new(x2,y2)}
    let (:position_third) { Position.new(x3,y3)}
    let (:facing_south) {Car.new(0, grid, position_first, :S)}
    let (:facing_east)  {Car.new(0, grid, position_first, :E)}
    let (:facing_north)  {Car.new(0, grid, position_sec, :N)}
    let (:facing_west)  {Car.new(0, grid, position_sec, :W)}
    let (:facing_wrong_direction) {Car.new(0, grid, position_first, :Start)}
  
  describe "Test move function" do
    it "facing north" do
      facing_north.move
      expect(facing_north.position.get_coordinates).to eq([x2, y2+1])
    end

    it "facing south" do 
      facing_south.move
      expect(facing_south.position.get_coordinates).to eq([x1, y1-1])
    end

    it "facing east" do 
      facing_east.move
      expect(facing_east.position.get_coordinates).to eq([x1+1, y1])
    end

    it "facing west" do
      facing_west.move
      expect(facing_west.position.get_coordinates).to eq([x2-1,y2])
    end
  end


  describe "Test turn left function" do
    it "facing north" do
      facing_north.turn_left
      expect(facing_north.direction).to eq(:W)
    end

    it "facing south" do
      facing_south.turn_left
      expect(facing_south.direction).to eq(:E)
    end

    it "facing west" do
      facing_west.turn_left
      expect(facing_west.direction).to eq(:S)
    end

    it "facing east" do
      facing_east.turn_left
      expect(facing_east.direction).to eq(:N)
    end

    it "facing wrong direction" do
      facing_wrong_direction.turn_left
      expect(facing_wrong_direction.direction).to eq("Wrong initial direction")
    end
  end

  describe "Test turn right function" do
    it "facing north" do
      facing_north.turn_right
      expect(facing_north.direction).to eq(:E)
    end

    it "facing south" do
      facing_south.turn_right
      expect(facing_south.direction).to eq(:W)
    end

    it "facing west" do
      facing_west.turn_right
      expect(facing_west.direction).to eq(:N)
    end

    it "facing east" do
      facing_east.turn_right
      expect(facing_east.direction).to eq(:S)
    end

    it "facing wrong direction" do
      facing_wrong_direction.turn_left
      expect(facing_wrong_direction.direction).to eq("Wrong initial direction")
    end
  end

  describe "Test get direction function and get location function" do 
    it "return correct direction" do
      expect(facing_west.direction).to eq(:W)
      expect(facing_east.direction).to eq(:E)
      expect(facing_south.direction).to eq(:S)
      expect(facing_north.direction).to eq(:N)
    end

    it "return correct location" do
      expect(facing_west.position.get_coordinates).to eq(position_sec.get_coordinates)
    end

    it "when direction is not valid" do
      expect(facing_wrong_direction.direction).to eq("Wrong initial direction")
    end
  end

  describe "test for stack commands function" do

    it 'do series commands' do
      facing_north.stack_commands([:F,:F,:R,:F,:L,:F])
      expect(facing_north.position.get_coordinates).to eq([5,8])
      expect(facing_north.direction).to eq(:N)
      expect(facing_north.car_status).to eq(0)
    end

    it 'test for serises of "move forward" commands' do
      facing_south.stack_commands([:F,:F])
      expect(facing_south.position.get_coordinates).to eq([3,1])
      expect(facing_south.direction).to eq(:S)
    end

    it 'test serises of "turn" commands' do
      facing_west.stack_commands([:R,:R,:L,:L,:L])
      expect(facing_west.position.get_coordinates).to eq([4,5])
      expect(facing_west.direction).to eq(:S)
    end

    it 'test for complicated commands' do
      facing_east.stack_commands([:F,:L,:F,:L,:F,:L,:F])
      expect(facing_east.position.get_coordinates).to eq([3,3])
      expect(facing_east.direction).to eq(:S)
    end
  end

  context "Test move_to_location function" do
    let (:destination_1)  {Position.new(15,15)}
    let (:destination_2) {Position.new(1,1)}

    context 'reaching to a north-east destination' do
      it 'reaching when the car is facing north' do
        facing_north.move_to_location(destination_1)
        expect(facing_north.position.get_coordinates).to eq(destination_1.get_coordinates)
        expect(facing_north.direction).to eq(:N)
      end

      it 'reaching when the car is facing south' do
        facing_south.move_to_location(destination_1)
        expect(facing_south.position.get_coordinates).to eq(destination_1.get_coordinates)
        expect(facing_south.direction).to eq(:N)
      end

      it 'reaching when the car is facing east' do
        facing_east.move_to_location(destination_1)
        expect(facing_east.position.get_coordinates).to eq(destination_1.get_coordinates)
        expect(facing_east.direction).to eq(:N)
      end

      it 'reaching when the car is facing west' do
        facing_west.move_to_location(destination_1)
        expect(facing_west.position.get_coordinates).to eq(destination_1.get_coordinates)
        expect(facing_west.direction).to eq(:N)
      end
    end

    context 'reaching to a south_west destination' do
      it 'reaching when the car is facing north' do
        facing_north.move_to_location(destination_2)
        expect(facing_north.position.get_coordinates).to eq(destination_2.get_coordinates)
        expect(facing_north.direction).to eq(:S)
      end

      it 'reaching when the car is facing south' do
        facing_south.move_to_location(destination_2)
        expect(facing_south.position.get_coordinates).to eq(destination_2.get_coordinates)
        expect(facing_south.direction).to eq(:S)
      end

      it 'reaching when the car is facing east' do
        facing_east.move_to_location(destination_2)
        expect(facing_east.position.get_coordinates).to eq(destination_2.get_coordinates)
        expect(facing_east.direction).to eq(:S)
      end

      it 'reaching when the car is facing west' do
        facing_west.move_to_location(destination_2)
        expect(facing_west.position.get_coordinates).to eq(destination_2.get_coordinates)
        expect(facing_west.direction).to eq(:S)
      end
     end
  end

  context 'testing operation within the grid boundary 0,50,0,50' do
    let (:destination_1)  {Position.new(30,55)}
    let (:destination_2)  {Position.new(57,30)}
    let (:destination_3)  {Position.new(10,-5)}
    let (:destination_4)  {Position.new(-4,7)}
    let (:destination_5) {Position.new(60,60)}
    
    it 'should return boundary max_y coordinate if the destination y coord lies off the grid' do
      facing_east.move_to_location(destination_1)
      expect(facing_east.position.get_coordinates).to eq([30,49])
    end

    it 'should return boundary max_x coordinate if the destination x coord lies off the grid' do
      facing_north.move_to_location(destination_2)
      expect(facing_north.position.get_coordinates).to eq([49,30])   
    end

    it 'should return boundary min_y coordinate if the destination y coord lies off the grid' do
      facing_west.move_to_location(destination_3)
      expect(facing_west.position.get_coordinates).to eq([10,0])
    end

    it 'should return boundary max_x coordinate if the destination x coord lies off the grid' do
      facing_south.move_to_location(destination_4)
      expect(facing_south.position.get_coordinates).to eq([0,7])
    end

    it 'should return boundary max_y and max_y coordinate if the destination x and y coord lie off the grid' do
      facing_east.move_to_location(destination_5)
      expect(facing_east.position.get_coordinates).to eq([49,49])
    end
  end

  context 'testing for reverse function' do
    it 'facing north ' do
      facing_north.reverse
      expect(facing_north.position.get_coordinates).to eq([4,4])
    end

    it 'facing east ' do
      facing_east.reverse
      expect(facing_east.position.get_coordinates).to eq([2,3])
    end

    it 'facing west ' do
      facing_west.reverse
      expect(facing_west.position.get_coordinates).to eq([5,5])
    end

    it 'facing south' do
      facing_south.reverse
      expect(facing_south.position.get_coordinates).to eq([3,4])
    end

  end

end

