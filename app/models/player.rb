class Player < ActiveRecord::Base
  attr_accessible :auction_value, :first_name, :last_name, :nfl_team, :position, :team_id, :contract_id, :is_drafted, :is_bought_out, :is_extended, :is_franchised
  
  belongs_to :team
  
  default_scope order("auction_value desc")
  
  scope :all_quarterbacks, lambda { where("position = ?", "QB").order("auction_value desc") }
  scope :all_receivers, lambda { where("position = ?", "WR").order("auction_value desc") }
  scope :all_running_backs, lambda { where("position = ?", "RB").order("auction_value desc") }
  scope :all_tight_ends, lambda { where("position = ?", "TE").order("auction_value desc") }
  scope :all_kickers, lambda { where("position = ?", "K").order("auction_value desc") }
  scope :all_defenses, lambda { where("position = ?", "DEF").order("auction_value desc") }
  
  
  def to_param
    "#{self.id}-#{self.first_name}-#{self.last_name}".parameterize
  end
  
  def full_name
    self.first_name + " " + self.last_name
  end
  

  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |player|
        csv << player.attributes.values_at(*column_names)
      end
    end
  end
    
    
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      player = find_by_id(row["id"]) || new
      player.attributes = row.to_hash.slice(*accessible_attributes)
      player.save!
    end
  end
end
