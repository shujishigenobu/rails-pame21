$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/120727-BuildDB-wamon_trinity/pame21"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
blastf = "#{srcd}/Pame2.orfs.pep_ALL.fasta.s3.tsv"
queryidf ="#{$railsdir}/db/load_data/orf_models_ids.txt"


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
STDERR.puts "sql was saved as '#{outf}'"
File.open(blastf).each do |l|
  a = l.chomp.split(/\t/, -1)
  name = a[0].split[0]
  id = queryid[name]

  if a.size == 14
    # do nothing
  elsif a.size == 11
    a << [nil,nil,nil]
    a.flatten!
  else
    raise
  end

  data = a.dup
  data[2] = data[2].to_i # length
  data[6] = data[6].to_i # start
  data[7] = data[7].to_i # stop
  data[8] = data[8].to_f # score

  sql = ""
  sql << "INSERT "
  sql << " INTO interpro_motifs (name, md5, length, analysis, signature_acc, signature_desc, start, stop, score, status, date, interpro_acc, interpro_desc, interpro_go, orf_model_id, created_at, updated_at) "
  sql << " VALUES ( "

  values = [name,data[1..-1], id, time_str, time_str].flatten

  values.size 



  values.each do |v|
    raise if v.to_s.size > 255
  end

  sql << values.map{|v| quote(v)}.join(", ")
  sql << ");"
   
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
