class TranscriptModel < ActiveRecord::Base
  attr_accessible :description, :len, :name, :seq

  has_many :orf_models
end
