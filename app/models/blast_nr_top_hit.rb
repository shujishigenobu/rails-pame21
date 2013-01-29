class BlastNrTopHit < ActiveRecord::Base
  attr_accessible :bitscore, :common_name, :description, :evalue, :kingdom, :len_align, :name, :order, :orf_model_id, :phylum, :query, :species, :taxid, :taxonomy

  belongs_to :orf_model
end
