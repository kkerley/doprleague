class Subcontract < ActiveRecord::Base
  attr_accessible :contract_id, :salary_amount, :team_id, :contract_year
  
  belongs_to :contract
  belongs_to :team
  
  has_one :player, through: :contract
  
  
  scope :current_year_or_later, lambda { where("contract_year >= ?", self.current_year).order("contract_year ASC") }
  # scope :this_year, lambda { where("contract_year == ?", self.current_year) }

  def self.current_year
    Time.now.year
  end

end
