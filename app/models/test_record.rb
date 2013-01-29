class TestRecord < ActiveRecord::Base
  attr_accessible :bitscore, :evalue, :gapopen, :length, :mismatch, :pident, :qend, :qlen, :qseqid, :qstart, :send, :slen, :sseqid, :sstart
end
