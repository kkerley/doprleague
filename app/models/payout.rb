class Payout < ActiveRecord::Base
  attr_accessible :year, :awards_attributes, :users_attributes
  
  has_many :awards
  
  accepts_nested_attributes_for :awards,
                                :reject_if => :all_blank,
                                :allow_destroy => true
                                
  default_scope order('year DESC')
end
