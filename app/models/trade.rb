class Trade < ActiveRecord::Base
  attr_accessible :is_accepted, :notes, :trader1_id, :trader2_id, :stipulations_attributes

  # has_many :teams
  has_many :stipulations, dependent: :destroy

  accepts_nested_attributes_for :stipulations

  validates_presence_of :trader2_id
  validates_associated :stipulations

  validate :check_trader2
  before_update :check_for_acceptance

  def trader_name(trader_id)
  	trader = Team.find(trader_id)
  	return trader.team_name
  end


  def calculate_budgets(trader1, trader2, year, direction, amount)
  	trader1_budget = Budget.find_by_team_id_and_year(trader1.id, year)
		trader2_budget = Budget.find_by_team_id_and_year(trader2.id, year)

		if direction == "to"
			trader1_budget.amount -= amount.to_i
			trader1_budget.save!

			trader2_budget.amount += amount.to_i
			trader2_budget.save!

		elsif direction == "from"
			trader1_budget.amount += amount.to_i
			trader1_budget.save!

			trader2_budget.amount -= amount.to_i
			trader2_budget.save!
		end
  end


  private

  def check_trader2
  	errors.add(:trader2_id, "You can't trade with yourself") if self.trader2_id == self.trader1_id
  end

  def check_for_acceptance
  	if self.is_accepted
  		trader1 = Team.find(self.trader1_id)
  		trader2 = Team.find(self.trader2_id)
  		# get all stipulations, check each for type and run the necessary methods
  		self.stipulations.each do |stip|
  			if stip.stipulation_type == "Cap space"
  				self.calculate_budgets(trader1, trader2, stip.year, stip.trade_direction, stip.terms)

  			elsif stip.stipulation_type == "Draft spot"

  			elsif stip.stipulation_type == "Player"
  				self.adjust_contracts(trader1, trader2, stip.year, stip.trade_direction, stip.terms, stip.rest_of_contract)
  				
  			end # end of stip.stipulation_type check
  		end # end of self.stipulations.each
  	end
  end #end of check_for_acceptance
end # end of class
