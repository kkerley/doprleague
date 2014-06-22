class Stipulation < ActiveRecord::Base
  attr_accessible :description, :player_id, :rest_of_contract, :stipulation_type, :trade_direction, :trade_id, :terms, :year
  belongs_to :trade
  belongs_to :player

  validates_presence_of :stipulation_type
  validates_presence_of :trade_direction
  validates_presence_of :player_id, if: :player_trade?

  scope :cap_space, lambda { where("stipulation_type = ?", "Cap space") }
  scope :draft_spots,  lambda { where("stipulation_type = ?", "Draft spot") }
  scope :player, lambda { where("stipulation_type = ?", "Player") }
  scope :other, lambda { where("stipulation_type = ?", "Other") }
  scope :for_year, lambda { |year| where(year: year) if year.present? }

  def player_trade?
  	self.stipulation_type == "Player"
  end

  def trade_accepted?
    self.trade.is_accepted
  end
end
