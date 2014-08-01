class Subcontract < ActiveRecord::Base
  # include SuperModule
  # include ModifiedCurrentYear
  attr_accessible :contract_id, :salary_amount, :team_id, :contract_year, :this_is_an_extension, :this_is_a_franchise_tag, :this_is_a_buyout
  
  belongs_to :contract
  belongs_to :team
  
  has_one :player, through: :contract
  
  
  scope :current_year_or_later, lambda { where("contract_year >= ?", self.current_year).order("contract_year ASC") }
  scope :future_years, lambda { where("contract_year > ?", self.current_year).order("contract_year ASC") }
  # scope :this_year, lambda { where("contract_year == ?", self.current_year) }

  def self.current_year
    # The new seasons starts on 8/1 so technically, it's the previous year through 7/31
    current_date = Time.now
    if current_date.month < 9
      current_date.year - 1
    else
      current_date.year
    end
  end

end
