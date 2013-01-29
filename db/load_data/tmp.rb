$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/120727-BuildDB-wamon_trinity/pame21"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

include Bio
     
srcd = "#{$railsdir}/db/data_source"

aafastaf = "#{srcd}/Pame2.orfs.130116s3.pep"
nafastaf = "#{srcd}/Pame2.orfs.130116s3.nuc"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = ActiveRecord::Base.connection.quote(Time.now.utc)
     
aafasta = {}
FlatFile.open(FastaFormat, aafastaf).each do |fas|
  aafasta[fas.entry_id] = fas
end

STDERR.puts "#{aafasta.keys.size} entries found"

o = File.open(outf, "w")
STDERR.puts "sql was saved as '#{outf}'"
FlatFile.open(FastaFormat, nafastaf).each_with_index do |fas, i|
  naseq = fas.seq
  aaseq = aafasta.fetch(fas.entry_id).seq
  definition = quote(fas.definition.strip)
  sql = ""
  sql << "INSERT "
  sql << " INTO orf_models (name) "
  sql << " VALUES ('#{fas.entry_id}')"
  sql << ";"
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
