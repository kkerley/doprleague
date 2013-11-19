class Team < ActiveRecord::Base
  attr_accessible :team_name, :user_id
  
  belongs_to :user
  has_many :players
  
  def self.list_team_options
    Team.select("id, team_name").map {|x| [x.id, x.team_name] }
  end
  
  def to_param
    "#{self.id}-#{self.team_name}".parameterize
  end
end
