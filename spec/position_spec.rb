require 'position'

describe Position do
	let (:grid) {Grid.new(0,50,0,50)}
	let (:x2) {4}
	let (:y2) {5}
	let (:positionSec) { Position.new(x2,y2)}

	it 'should return the expected x value' do
	expect(Position.new(2,4).x).to eq(2)
	end

	it 'should return the expected y value' do
	expect(Position.new(2,4).y).to eq(4)
	end

  	it 'checking the validity of a position on the grid' do
      expect(positionSec.is_valid?(grid)).to eq(true)
    end

  	it 'check an incremented position is valid' do
      expect(positionSec.+(:y).is_valid?(grid)).to eq(true)
    end

end