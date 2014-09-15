class AnnualGmAction < ActiveRecord::Base
  attr_accessible :bought_out_player_id, :extended_player_id, :franchised_player_id, :has_bought_out, :has_extended, :has_franchised, :team_id, :year

  belongs_to :team
end
