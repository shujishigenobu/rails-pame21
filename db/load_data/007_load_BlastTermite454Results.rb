$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/120727-BuildDB-wamon_trinity/pame21"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
blastf = "#{srcd}/Pame2.orfs.pep.vs.Hsj_Nta_Rsp.pep.combined.fa.blastp.fmt6c.txt"


queryidf ="#{$railsdir}/db/load_data/orf_models_ids.txt"

table = "blast_termite454_results"

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
 a
  if a.size == 14
    # do nothing
  else
    p a
    raise
#    next
  end

  data = a.dup

  colnames = %w{ q_seqid s_seqid pident alen mismatch gapopen q_start q_end s_start s_end evalue bitscore q_len s_len description taxid species common_name orf_model_id}

  sql = ""
  sql << "INSERT "
  sql << " INTO #{table} ("
  sql << colnames.join(", ")
  sql << ") "
  sql << " VALUES ( "

  values = data[0..13]
  case a[1]
  when /^Hsj/
    sp = "Hodotermopsis sjoestedti"
    taxid = 377914
  when /^Nta/
    sp = "Nasutitermes takasagoensis"
    taxid = 62960
  when /^Rsp/
    sp = "Reticulitermes speratus"
    taxid = 60591
  else
    p a[1]
    raise
  end
  values += ["NULL", taxid, sp, "NULL"]
  values << id

#  values.each do |v|
#    raise if v.to_s.size > 255
#  end

  sql << values.map{|v| quote(v)}.join(", ")
  sql << ");"
   
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end

o.close
