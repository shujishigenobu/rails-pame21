class OrfModel < ActiveRecord::Base
  attr_accessible :aaseq, :description, :name, :naseq

  has_one :blast_nr_top_hit
  has_one :expression_level
  has_many :interpro_motifs
  has_one :orthodb5_hit
  has_many :blast_nr_results
  has_many :blast_termite454_results

  belongs_to :transcript_model

end
