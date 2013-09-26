class Team < ActiveRecord::Base
  attr_accessible :team_name, :user_id
  
  belongs_to :user
end
