class SuperBowlPick < ActiveRecord::Base
  include ModifiedCurrentYear
  
  attr_accessible :combined_total, :nfl_team_id, :super_bowl_id, :team_id

  belongs_to :super_bowl
  belongs_to :nfl_team
  belongs_to :team

end
