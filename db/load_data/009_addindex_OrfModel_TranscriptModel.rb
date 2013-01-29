$railsdir = "/home/shige/Projects/n11723-MiuraG/Analysis/120727-BuildDB-wamon_trinity/pame21"

outf = "#{__FILE__}.sql"

require "#{$railsdir}/config/environment.rb"

     
srcd = "#{$railsdir}/db/data_source"
fastaf = "#{srcd}/Pame2.orfs.130116s3.nuc"


compidf ="#{$railsdir}/db/load_data/transcript_model_ids.txt"

table = "orf_models"

def quote(str)
  ActiveRecord::Base.connection.quote(str)
end
     
time_str = Time.now.utc
     
compid = {}
File.open(compidf).each do |l|
  next if /^\#/.match(l)
  a = l.chomp.split(/\t/)
  compid[a[1]] = a[0]
end

OrfModel.transaction do 
  OrfModel.find(:all).each do |om|
    p [om.id, om.name]
    p  compname = /(comp\d+_c\d+_seq\d+):/.match(om.description)[1]
    p  cid = compid.fetch(compname)
    p om.update_attribute(:transcript_model_id, cid)
  end
end

exit

FlatFile.open(FastaFormat, fastaf).each do |fas|
  name = fas.entry_id
  description = fas.definition

p  compname = /(comp\d+_c\d+_seq\d+):/.match(description)[1]

p  tid = queryid[compname]

  colnames = %w{ name description seq len }

  sql = ""
  sql << "INSERT "
  sql << " INTO #{table} ("
  sql << colnames.join(", ")
  sql << ") "
  sql << " VALUES ( "

  values = [name, description, seq, len]

#  values.each do |v|
#    raise if v.to_s.size > 255
#  end

  sql << values.map{|v| quote(v)}.join(", ")
  sql << ");"
   
  o.puts sql 
#  FastaEntry.connection.execute(sql)
end


