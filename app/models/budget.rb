class Budget < ActiveRecord::Base
  attr_accessible :amount, :team_id, :year

  belongs_to :team
end
