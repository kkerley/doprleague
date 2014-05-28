class NflTeam < ActiveRecord::Base
  include PublicActivity::Common
  
  attr_accessible :city, :conference, :mascot, :shorthand, :avatar, :bye_week

  has_many :super_bowls, foreign_key: :nfl_winner_id
  has_many :super_bowl_picks

  default_scope order ("city asc")
  scope :afc, lambda { where("conference = ?", "AFC").order("city asc") }
  scope :nfc, lambda { where("conference = ?", "NFC").order("city asc") }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "32x32>", :tiny => "16x16>" }, :default_url => "/images/:style/missing.png"


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

  def total_players
    players = Player.find_all_by_nfl_team(self.shorthand)
    return players.count
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      nfl_team = find_by_id(row["id"]) || new
      nfl_team.attributes = row.to_hash.slice(*accessible_attributes)
      nfl_team.save!
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |nfl_team|
        csv << nfl_team.attributes.values_at(*column_names)
      end
    end
  end
end
