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


  
  
  def to_param
    "#{self.id}-#{self.first_name}-#{self.last_name}".parameterize
  end
  

  # used for a number of methods for determining contract validity
  def current_year
    Time.now.year
  end

  
  def full_name
   [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end
  


  def is_contracted? # used for the players#index action to display whether or not a player has a current/active contract or not
    if self.contracts.count == 0
      return false
    else 
      these_contracts = [] # empty array to hold non-bought out contracts
      self.contracts.each do |contract|
        unless contract.is_bought_out
          these_contracts << contract
        end
      end # end of |contract| block

      if these_contracts.size > 0
        these_contracts.each do |con|
          if (con.contract_start_year + con.contract_length) > current_year
            return true
          else
            return false
          end
        end

      else
        return false
      end
    end
    return false
  end

  def this_year # used for getting the subcontract for the current year to display the correct team name on the players#index action
    self.subcontracts.each do |sub|
      if sub.contract_year == current_year && !sub.contract.is_bought_out
        return sub
      end
    end
  end
  
  def this_team_contract(team) # needed to pull in only the non-bought-out contract for subcontracts on the team#show page
    self.contracts.each do |contract|
      contract.subcontracts.each do |sub|
        if sub.team_id == team.id
          return contract
        end
      end
    end
  end
  
  def self.text_search(query) # search by first_name, last_name or position
    if query.present?
      rank = <<-RANK
          ts_rank(to_tsvector(first_name), plainto_tsquery(#{sanitize(query)})) +
          ts_rank(to_tsvector(last_name), plainto_tsquery(#{sanitize(query)})) + 
          ts_rank(to_tsvector(position), plainto_tsquery(#{sanitize(query)}))
        RANK
      where("first_name @@ :q or last_name @@ :q or position @@ :q", q: "%#{query}%").order("#{rank} desc")
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
