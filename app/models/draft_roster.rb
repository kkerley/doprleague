class DraftRoster < ActiveRecord::Base
  attr_accessible :name, :team_id, :roster_spots_attributes

  belongs_to :team

  has_many :roster_spots, dependent: :destroy
  has_many :players, through: :roster_spots

  accepts_nested_attributes_for :roster_spots


  def to_param
    "#{self.id}-#{self.name}".parameterize
  end

  def already_listed?(player)
  	self.players.include?(player)
  end
end
