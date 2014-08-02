class Team < ActiveRecord::Base
  include ModifiedCurrentYear
  
  attr_accessible :team_name, :user_id, :division
  
  belongs_to :user
  has_many :subcontracts, fully_load: true
  has_many :players, through: :subcontracts, fully_load: true
  has_many :contracts, through: :subcontracts, fully_load: true
  has_many :team_records, fully_load: true
  has_many :budgets, fully_load: true
  has_many :events, fully_load: true
  has_many :draft_rosters, fully_load: true
  has_many :super_bowls, foreign_key: :dopr_winner_id, fully_load: true
  has_many :super_bowl_picks, fully_load: true
  # has_many :trades

  default_scope order('team_name ASC')

  scope :philip_division, lambda { where(division: "Philip") }
  scope :russell_division, lambda { where(division: "Russell") }

  after_create :build_budgets
  
  
  def to_param
    "#{self.id}-#{self.team_name}".parameterize
  end

  def self.active_teams
    active_teams = []

    self.philip_division.each do |team|
      if team.user.is_current
        active_teams << team
      end
    end

    self.russell_division.each do |team|
      if team.user.is_current
        active_teams << team
      end
    end

    return active_teams
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

  def unique_players
    self.get_subcontract_players.uniq
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
  
  
  def build_budgets
    if Time.now.month < 8
      current_year = Time.now.year - 1
    else
      current_year = Time.now.year
    end 

    50.times { 
      b = Budget.new
      b.team_id = self.id
      b.year = current_year
      current_year += 1
      b.save!
    }
  end

  def available_for_extension(players)
    players_to_extend = []

    players.each do |player|
      if player.is_contracted?
        unless player.current_contract.is_extended? || player.current_contract.is_franchised?
          unless player.this_year == player.current_contract.subcontracts.last # can't extend a player in his final contract year. He can be franchised, though.
            if player.current_contract.is_drafted
              team = player.this_year.team
              if player.current_contract.still_belongs_to?(team)
                players_to_extend << player
              end
            end
          end
        end
      end
    end
    players_to_extend.uniq
  end

  def available_for_franchise(players, team)
    players_to_franchise = []

    players.each do |player|
      if player.is_contracted?
        unless player.current_contract.is_franchised?
          this_team = team
          if player.current_contract.still_belongs_to?(this_team) || player.current_contract.will_belong_to?(this_team)
            players_to_franchise << player
          end
        end
      end
    end
    players_to_franchise.uniq
  end

  #breakdown by bye week
  def players_by_bye_week(bye_week, team)
    players = self.get_subcontract_players
    players_on_bye = []

    players.each do|player|
      if player.nfl_team_model
        if player.nfl_team_model.bye_week == bye_week
          if player.is_contracted? && player.this_year.team_id == team.id
            players_on_bye << player
          end
        end
      end
    end
    players_on_bye.uniq
  end
end
