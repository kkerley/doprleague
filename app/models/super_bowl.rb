class SuperBowl < ActiveRecord::Base
  include ModifiedCurrentYear

  attr_accessible :dopr_winner_id, :nfl_team1_final_score, :nfl_team1_id, :nfl_team2_final_score, :nfl_team2_id, :nfl_winner_id, :tie_breaker, :year

  belongs_to :nfl_team
  belongs_to :team
  has_many :super_bowl_picks

  scope :current_super_bowl, lambda { where("year = ?", current_year) }

end
