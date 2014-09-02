require 'position'

describe Position do
	it 'should return the expected x value' do
	expect(Position.new(2,4).x).to eq(2)
	end

	it 'should return the expected y value' do
	expect(Position.new(2,4).y).to eq(4)
	end

end