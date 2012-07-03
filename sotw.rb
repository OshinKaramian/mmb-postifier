#~/usr/bin/env ruby
puts "Gathering Information for: " + ARGV[0] + "\n\n"

Dir["models/**/*.rb"].each { |file| require file }

load ARGV[0]
