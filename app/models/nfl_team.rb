class NflTeam < ActiveRecord::Base
  attr_accessible :city, :conference, :mascot, :shorthand

  has_many :super_bowls, foreign_key: :nfl_winner_id
  has_many :super_bowl_picks

  default_scope order ("city asc")
  scope :afc, lambda { where("conference = ?", "AFC").order("city asc") }
  scope :nfc, lambda { where("conference = ?", "NFC").order("city asc") }


  def to_param
    "#{self.id}-#{self.city}-#{self.mascot}".parameterize
  end
  
  def full_team_name
   [city, mascot].join(' ')
  end

  def full_team_name=(name)
    split = name.split(' ', 2)
    self.city = split.first
    self.mascot = split.last
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      nfl_team = find_by_id(row["id"]) || new
      nfl_team.attributes = row.to_hash.slice(*accessible_attributes)
      nfl_team.save!
    end
  end
end
