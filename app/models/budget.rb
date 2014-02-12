class Budget < ActiveRecord::Base
  include ModifiedCurrentYear
  #extend FriendlyId

  attr_accessible :amount, :team_id, :year

  #friendly_id :year#, :use => [:finders]

  belongs_to :team



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
