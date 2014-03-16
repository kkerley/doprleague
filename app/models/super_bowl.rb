class SuperBowl < ActiveRecord::Base
  # include ModifiedCurrentYear
  extend FriendlyId

  attr_accessible :dopr_winner_id, :nfl_team1_final_score, :nfl_team1_id, :nfl_team2_final_score, :nfl_team2_id, :nfl_winner_id, :tie_breaker, :year
  friendly_id :year
  validates_uniqueness_of :year
  
  has_many :super_bowl_picks
  accepts_nested_attributes_for :super_bowl_picks
  
  default_scope order('year desc')

  before_save :check_for_nfl_winner
  before_save :check_for_dopr_winner

  def self.current_year
    # The new seasons starts on 8/1 so technically, it's the previous year through 7/31
    current_date = Time.now
    if current_date.month < 8
      current_date.year - 1
    else
      current_date.year
    end
  end
  
  def self.current_super_bowl
  	sb = SuperBowl.find_by_year(current_year)
  end

  def find_my_pick(sb, team_id)
    # sb.super_bowl_picks.each do |pick|
      # if pick.team_id == team_id
        # pick
      
      # end
    # end
    picks_arr = sb.super_bowl_picks
  	# p = picks_arr.where(team_id: team_id).index_by(&:id).values
    p = picks_arr.find_by_team_id(team_id)
  end

  def check_for_nfl_winner
    if self.nfl_team1_final_score && self.nfl_team2_final_score 
      if self.nfl_team1_final_score > self.nfl_team2_final_score
        self.nfl_winner_id = self.nfl_team1_id
      else
        self.nfl_winner_id = self.nfl_team2_id
      end
      
    end
  end

  def check_for_dopr_winner
    if self.tie_breaker
      # Hard case: tie-breaker necessary
      # Need to add logic for what happens when tie breaker box is checked (for those people who chose the same team, a text box input for total score should appear on the Super Bowl page)
    else 
      if self.nfl_winner_id
        # Easy case: no need need for a tie-breaker
        self.super_bowl_picks.each do |pick|
          if pick.nfl_team_id == self.nfl_winner_id
            self.dopr_winner_id = pick.team_id
          end
        end
      end
    end
  end

# end of class 
end
