class Team < ActiveRecord::Base
  attr_accessible :team_name, :user_id
  
  belongs_to :user
  has_many :subcontracts
  has_many :players, through: :subcontracts
  
  default_scope order('team_name ASC')
  
  
  def to_param
    "#{self.id}-#{self.team_name}".parameterize
  end
  
  def current_year
    Time.now.year
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
  
  
  
  
end
