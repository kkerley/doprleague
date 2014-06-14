class Stipulation < ActiveRecord::Base
  attr_accessible :description, :player_id, :rest_of_contract, :stipulation_type, :trade_direction, :trade_id, :terms, :year
  belongs_to :trade

  validates_presence_of :stipulation_type
  validates_presence_of :trade_direction
end
