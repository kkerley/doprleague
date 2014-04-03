class SuperBowlPick < ActiveRecord::Base
  include ModifiedCurrentYear
  
  attr_accessible :combined_total, :nfl_team_id, :super_bowl_id, :team_id

  belongs_to :super_bowl
  belongs_to :nfl_team
  belongs_to :team

  validates_presence_of :nfl_team_id

  scope :by_team, ->(team) { where nfl_team_id: team }

  def abs_value(super_bowl_total_points_scored)
  	(super_bowl_total_points_scored - self.combined_total).abs
  end
end
