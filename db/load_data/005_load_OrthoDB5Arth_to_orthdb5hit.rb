$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/120727-BuildDB-wamon_trinity/pame21"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
blastf = "#{srcd}/Pame2.orfs.pep.ortholog.OrthDB5_Arthropoda.s3"
queryidf ="#{$railsdir}/db/load_data/orf_models_ids.txt"

table = "orthodb5_hits"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = Time.now.utc
     
queryid = {}
File.open(queryidf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  queryid[a[1]] = a[0]
end

queryid


o = File.open(outf, "w")
STDERR.puts "sql is being saved as '#{outf}'"
File.open(blastf).each do |l|
  a = l.chomp.split(/\t/, -1)
  name = a[0]
  id = queryid[name]

 a.size

  if a.size == 20
    # do nothing
  else
    next
  end

  data = a.dup

  sql = ""
  sql << "INSERT "
  sql << " INTO #{table} (name, orthgrp, besthit, blast_record, orf_model_id, created_at, updated_at) "
  sql << " VALUES ( "

  values = [name, data[1], data[2]]
  values << data[5..-1].join("\t")
  values << id
  values += [time_str, time_str]

#  values.each do |v|
#    raise if v.to_s.size > 255
#  end

  sql << values.map{|v| quote(v)}.join(", ")
  sql << ");"
   
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
