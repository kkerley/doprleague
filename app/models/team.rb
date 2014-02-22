class Team < ActiveRecord::Base
  include ModifiedCurrentYear
  
  attr_accessible :team_name, :user_id, :division
  
  belongs_to :user
  has_many :subcontracts
  has_many :players, through: :subcontracts
  has_many :contracts, through: :subcontracts
  has_many :team_records
  has_many :budgets
  has_many :events
  has_many :draft_rosters
  has_many :super_bowls, foreign_key: :dopr_winner_id
  has_many :super_bowl_picks

  default_scope order('team_name ASC')

  scope :philip_division, lambda { where(division: "Philip") }
  scope :russell_division, lambda { where(division: "Russell") }
  
  
  def to_param
    "#{self.id}-#{self.team_name}".parameterize
  end
  
  
  def self.list_team_options
    Team.select("id, team_name").map {|x| [x.id, x.team_name] }
  end
  
  # for contract creation; removes the non-current members from the drop down and orders the active members alphabetically to cut down on confusion
  def self.current_league_members
    users = User.current_members
    teams = []
    
    users.each do |user|
      teams << user.team
    end
    teams.sort_by!{ |t| t.team_name }
  end
  
  
  def get_subcontract_players
    subcontracts = self.subcontracts
    valid_subs = []
    
    subcontracts.each do |sub|
      if sub.contract_year >= current_year
        valid_subs << sub.player
      end
    end
    valid_subs
  end
  
  
  def calculate_yearly_salary(year)
    subcontracts = self.subcontracts.where("contract_year = ?", year) #finds all subcontracts for this team and filters out only the ones for the year passed in
    total_salary = 0
    
    subcontracts.each do |sub|
      total_salary += sub.salary_amount 
    end
    total_salary
  end
  
  def get_budget(year)
    self.budgets.find_by_year(year)
  end

  def remainder(salary_total, yearly_budget)
    yearly_budget - salary_total
  end
  
  
end
