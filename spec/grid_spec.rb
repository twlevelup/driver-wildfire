
require 'grid'
require 'position'

RSpec.describe Grid do
	subject { Grid.new(0,50,0,50) }

	let (:valid_position) { Position.new(2,0) }
	let (:invalid_position) { Position.new(-2,0) }

	it 'cheking point (2,0), should return true' do
	    expect(subject.valid_position?(valid_position)).to eq(true)
	end

	it 'should return false for a location outside the grid' do
	    expect(subject.valid_position?(invalid_position)).to eq(false)
	end
end
