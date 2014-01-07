class TeamRecord < ActiveRecord::Base
  attr_accessible :division_record, :moves, :pct, :pts_against, :pts_for, :rank, :standing_id, :streak, :team_id, :wlt

  belongs_to :standing
  belongs_to :team


end
