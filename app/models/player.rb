class Player < ActiveRecord::Base
  attr_accessible :auction_value, :first_name, :last_name, :nfl_team, :position, :is_drafted, :is_bought_out, :is_extended, :is_franchised, :bye_week, :full_name, :contracts_attributes, :subcontracts_attributes
  
  has_many :contracts
  has_many :subcontracts, through: :contracts
  has_many :teams, through: :subcontracts
  
  default_scope order("auction_value desc")
  
  accepts_nested_attributes_for :contracts, :reject_if => lambda { |a| a[:contracted_team].blank? }   
  accepts_nested_attributes_for :subcontracts, :reject_if => lambda { |a| a[:team_id].blank? }
  
  scope :all_quarterbacks, lambda { where("position = ?", "QB").order("auction_value desc") }
  scope :all_receivers, lambda { where("position = ?", "WR").order("auction_value desc") }
  scope :all_running_backs, lambda { where("position = ?", "RB").order("auction_value desc") }
  scope :all_tight_ends, lambda { where("position = ?", "TE").order("auction_value desc") }
  scope :all_kickers, lambda { where("position = ?", "K").order("auction_value desc") }
  scope :all_defenses, lambda { where("position = ?", "DEF").order("auction_value desc") }
  
  scope :current_year_or_later, lambda { where("contract_year >= ?", self.current_year).order("contract_year ASC") }
  
  
  def to_param
    "#{self.id}-#{self.first_name}-#{self.last_name}".parameterize
  end
  
  
  def full_name
   [first_name, last_name].join(' ')
  end
  
  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end
  
  def is_contracted?
    return true if self.contracts.count > 0
  end
  
  
  
   
  
  def self.text_search(query)
    if query.present?
      rank = <<-RANK
          ts_rank(to_tsvector(first_name), plainto_tsquery(#{sanitize(query)})) +
          ts_rank(to_tsvector(last_name), plainto_tsquery(#{sanitize(query)}))
        RANK
      where("first_name @@ :q or last_name @@ :q", q: "%#{query}%").order("#{rank} desc")
    else
      scoped
    end
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
