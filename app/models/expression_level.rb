class ExpressionLevel < ActiveRecord::Base
  attr_accessible :idx10, :idx11, :idx12, :idx7, :idx8, :idx9, :name

  belongs_to :orf_model
end
