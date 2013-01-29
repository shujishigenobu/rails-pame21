$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/120727-BuildDB-wamon_trinity/pame21"

require "#{$railsdir}/config/environment.rb"

puts "\# " + %w{id name}.join("\t")

TranscriptModel.all.each do |c|
  puts [c.id, c.name].join("\t")
end
