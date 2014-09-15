require './lib/commandOperation'

begin
  
  if ARGV.size() != 2
  	#puts "#{ARGV.size()}"
    raise ArgumentError, 'Please input 2 arguments!'
  end
  
  commandOperation = CommandOperation.new(ARGV[0], ARGV[1]) 
  puts commandOperation.getLocation()
  rescue ArgumentError => e
    puts e.message 
end           