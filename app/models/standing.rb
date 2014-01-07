class Standing < ActiveRecord::Base
  attr_accessible :year, :team_records_attributes

  has_many :team_records
  has_many :teams, through: :team_records

  accepts_nested_attributes_for :team_records

  default_scope order('year DESC')


  
end
