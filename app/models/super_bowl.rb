class SuperBowl < ActiveRecord::Base
  # include ModifiedCurrentYear
  attr_accessible :dopr_winner_id, :nfl_team1_final_score, :nfl_team1_id, :nfl_team2_final_score, :nfl_team2_id, :nfl_winner_id, :tie_breaker, :year
  has_many :super_bowl_picks

  validates_uniqueness_of :year

  accepts_nested_attributes_for :super_bowl_picks

  #scope :current_super_bowl, lambda { where("year = ?", current_year) }

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

# end of class 
end
