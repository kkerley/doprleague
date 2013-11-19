class SalaryProgression < ActiveRecord::Base
  attr_accessible :auction_value, :year2, :year3, :year4, :year5
  
  default_scope order('auction_value ASC')
end
