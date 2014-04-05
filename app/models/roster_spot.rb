class RosterSpot < ActiveRecord::Base
  attr_accessible :draft_roster_id, :player_id, :position
  belongs_to :draft_roster
  belongs_to :player

  acts_as_list
end
