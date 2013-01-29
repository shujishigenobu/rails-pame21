$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/120727-BuildDB-wamon_trinity/pame21"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
blastf = "#{srcd}/Pame2.orfs.130115s2.pep_ALL.fasta.vs.nr.blast.fmt6.top.ann4.s3.txt"
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
  q = a[0]
  id = queryid[q]

  sql = ""
  sql << "INSERT "
  sql << " INTO blast_nr_top_hits (query, name, len_align, evalue, bitscore, description, taxid, species, common_name, taxonomy, orf_model_id, created_at, updated_at) "
  sql << " VALUES ( '#{q}', '#{a[2]}', #{a[3]}, #{a[5]}, #{quote(a[6])}, #{quote(a[8])}, #{quote(a[9])}, #{quote(a[10])}, #{quote(a[11])}, #{quote(a[13])}, #{id}, #{time_str}, #{time_str}) "
  sql << ";"
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
