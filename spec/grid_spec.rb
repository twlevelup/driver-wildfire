
require 'grid'
require 'position'

RSpec.describe Grid do
	subject { Grid.new(0,50,0,50) }

	let (:valid_position) { Position.new(2,0) }
	let (:invalid_position) { Position.new(-2,0) }

	it 'should return true for a valid location on the grid' do
		expect(valid_position.is_valid?(valid_position, subject)).to eq(true)
	end

	it 'should return false for a location outside the grid' do
	    expect(invalid_position.is_valid?(invalid_position, subject)).to eq(false)
	end
end
