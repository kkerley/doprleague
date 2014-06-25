class Budget < ActiveRecord::Base
  include ModifiedCurrentYear
  #extend FriendlyId

  attr_accessible :amount, :team_id, :year

  #friendly_id :year#, :use => [:finders]

  belongs_to :team

  default_scope order('year ASC')

  def calculated_amount
    stipulations = Stipulation.for_budget(self.id)

    if stipulations.count > 0
      stipulations.each do |stip|
        if stip.trade.trader1_id == self.team_id
          if stip.trade_direction == "from"
            return self.amount + stip.terms.to_i
          else 
            return self.amount - stip.terms.to_i
          end
        elsif stip.trade.trader2_id == self.team_id
          if stip.trade_direction == "from"
            return self.amount - stip.terms.to_i
          else 
            return self.amount + stip.terms.to_i
          end
        end
      end
    else
      return self.amount
    end
  end


  def build_budgets(team)
	50.times { 
		b = Budget.new
		b.team_id = team.id
		b.year = current_year
		current_year += 1
		b.save!
	}
  end

end
