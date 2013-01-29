$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/120727-BuildDB-wamon_trinity/pame21"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
blastf = "#{srcd}/eXpress.counts.merged.s3.TMM.cpm"
queryidf ="#{$railsdir}/db/load_data/orf_models_ids.txt"


def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = ActiveRecord::Base.connection.quote(Time.now.utc)
     
queryid = {}
File.open(queryidf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  queryid[a[1]] = a[0]
end

p queryid


o = File.open(outf, "w")
STDERR.puts "sql was saved as '#{outf}'"
File.open(blastf).each do |l|
  a = l.chomp.split(/\t/, -1)
  id = queryid[a[0]]

  sql = ""
  sql << "INSERT "
  sql << " INTO expression_levels (name, idx10, idx11, idx12, idx7, idx8, idx9, created_at, updated_at, orf_model_id) "
  sql << " VALUES ( '#{a[0]}', #{a[1]}, #{a[2]}, #{a[3]}, #{a[4]}, #{a[5]}, #{a[6]}, #{time_str}, #{time_str}, #{id}) "
  sql << ";"
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
