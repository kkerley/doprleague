class SuperBowl < ActiveRecord::Base
  attr_accessible :dopr_winner_id, :nfl_team1_final_score, :nfl_team1_id, :nfl_team2_final_score, :nfl_team2_id, :nfl_winner_id, :tie_breaker

  has_many :super_bowl_picks
  

end
