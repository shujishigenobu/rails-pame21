class InterproMotif < ActiveRecord::Base
  attr_accessible :analysis, :date, :ingerpro_go, :interpro_acc, :interpro_desc, :length, :md5, :name, :orf_model_id, :score, :signature_acc, :signature_desc, :start, :status, :stop

  belongs_to :orf_model
end
