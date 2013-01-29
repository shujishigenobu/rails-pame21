class Protein < ActiveRecord::Base
  attr_accessible :desc, :name, :seq
end
