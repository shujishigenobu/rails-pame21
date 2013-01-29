class BlastTermite454Result < ActiveRecord::Base
  attr_accessible :alen, :bitscore, :common_name, :description, :evalue, :gapopen, :mismatch, :orf_model_id, :pident, :q_end, :q_len, :q_seqid, :q_start, :s_end, :s_len, :s_seqid, :s_start, :species, :taxid

  belongs_to :orf_model
end
