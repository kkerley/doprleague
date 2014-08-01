class Trade < ActiveRecord::Base
  include PublicActivity::Common
  
  attr_accessible :notes, :trader1_accepted, :trader1_id, :trader2_accepted, :trader2_id, :is_rejected, :stipulations_attributes

  # has_many :teams
  has_many :stipulations, dependent: :destroy
  has_many :players, through: :stipulations

  accepts_nested_attributes_for :stipulations, allow_destroy: true

  validates_presence_of :trader2_id
  validates_associated :stipulations

  validate :check_trader2
  
  validates :trader1_accepted, inclusion: { in: [true] }, on: :create

  # before_update :check_for_changes
  before_update :check_for_both_acceptance

  scope :for_team, lambda { |team_id| where("trader1_id = ? or trader2_id = ?", team_id, team_id) }
  scope :accepted_trades, lambda { where("trader1_accepted = ? and trader2_accepted = ?", true, true) }
  scope :initiated_trades, lambda { |team_id| where("trader1_id = ?", team_id) }
  scope :is_recipient, lambda { |team_id| where("trader2_id = ?", team_id) }
  scope :pending_trades, lambda { where(trader2_accepted: nil) }
  scope :rejected_trades, lambda { where(is_rejected: true) }

  def trader_name(trader_id)
  	trader = Team.find(trader_id)
  	return trader.team_name
  end

  def calculate_budgets(trader1, trader2, stipulation)
    trader1_budget = Budget.find_by_team_id_and_year(trader1.id, stipulation.year)
    trader2_budget = Budget.find_by_team_id_and_year(trader2.id, stipulation.year)

    stipulation.trader1_budget_id = trader1_budget.id
    stipulation.trader2_budget_id = trader2_budget.id
    stipulation.save!

  end

  def adjust_contracts(trader1, trader2, year, direction, player_id, rest_of_contract, terms)
    player = Player.find(player_id)

    if rest_of_contract
      player.current_contract.subcontracts.each do |sub|
        if sub.contract_year >= year
          update_subcontract(sub, direction, trader1, trader2)
        end
      end
    else
      player.current_contract.subcontracts.each do |sub|
        if sub.contract_year == year
          update_subcontract(sub, direction, trader1, trader2)
        end
      end
    end
  end

  def self.accepted_trades_stipulations(trades)
    accepted_stipulations = []

    trades.each do |trade|
      if trade.is_accepted
        trade.stipulations.each do |stip|
          accepted_stipulations << stip
        end
      end
    end
    return accepted_stipulations
  end

  def is_accepted
    self.trader1_accepted && self.trader2_accepted
  end

  private

  def check_trader2
  	errors.add(:trader2_id, "You can't trade with yourself") if self.trader2_id == self.trader1_id
  end

  def check_for_both_acceptance
  	if self.is_accepted
  		trader1 = Team.find(self.trader1_id)
  		trader2 = Team.find(self.trader2_id)
  		# get all stipulations, check each for type and run the necessary methods
  		self.stipulations.each do |stip|
  			if stip.stipulation_type == "Cap space"
  				# self.calculate_budgets(trader1, trader2, stip.year, stip.trade_direction, stip.terms)
          self.calculate_budgets(trader1, trader2, stip)
  			elsif stip.stipulation_type == "Draft spot"

  			elsif stip.stipulation_type == "Player"
  				self.adjust_contracts(trader1, trader2, stip.year, stip.trade_direction, stip.player_id, stip.rest_of_contract, stip.terms)
  				
  			end # end of stip.stipulation_type check
  		end # end of self.stipulations.each
  	end # end of self.is_accepted

  end #end of check_for_acceptance

  def update_subcontract(sub, direction, trader1, trader2)  
    if direction == "to"
      sub.team_id = trader2.id
      sub.save!
    elsif direction == "from"
      sub.team_id = trader1.id
      sub.save!
    end
  end

end # end of class
