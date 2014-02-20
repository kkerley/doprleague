class NflTeam < ActiveRecord::Base
  attr_accessible :city, :conference, :mascot, :shorthand

  scope :afc, lambda { where("conference = ?", "AFC").order("city asc") }
  scope :nfc, lambda { where("conference = ?", "NFC").order("city asc") }
  

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      nfl_team = find_by_id(row["id"]) || new
      nfl_team.attributes = row.to_hash.slice(*accessible_attributes)
      nfl_team.save!
    end
  end
end
