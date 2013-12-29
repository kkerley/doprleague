class Subcontract < ActiveRecord::Base
  attr_accessible :contract_id, :salary_amount, :team_id, :contract_year
  
  belongs_to :contract
  belongs_to :team
  
  has_one :player, through: :contract
  
end
