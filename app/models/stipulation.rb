class Stipulation < ActiveRecord::Base
  attr_accessible :description, :player_id, :rest_of_contract, :stipulation_type, :trade_direction, :trade_id, :terms, :year
  belongs_to :trade
  belongs_to :player

  validates_presence_of :stipulation_type
  validates_presence_of :trade_direction
  validates_presence_of :player_id, if: :player_trade?

  def player_trade?
  	self.stipulation_type == "Player"
  end
end
