class Player < ActiveRecord::Base
  include ModifiedCurrentYear

  attr_accessible :auction_value, :first_name, :last_name, :nfl_team, :position, :is_drafted, :is_bought_out, :is_extended, :is_franchised, :bye_week, :full_name, :contracts_attributes, :subcontracts_attributes
  
  has_many :contracts
  has_many :subcontracts, through: :contracts
  has_many :teams, through: :subcontracts
  
  # default_scope order("auction_value desc")
  
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
  

  
  def full_name
   [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end
  

  def is_contracted? # used for the players#index action to display whether or not a player has a current/active contract or not. ONLY RETURNS TRUE OR FALSE
    
    adjusted_contract_length = 0

    if self.contracts.count == 0
      return false # no contracts
    else 
      these_contracts = [] # empty array to hold non-bought out contracts
      self.contracts.each do |contract|
        unless contract.is_bought_out
          these_contracts << contract # adding non-bought out contract to array
        end
      end # end of |contract| block

      if these_contracts.size > 0
        these_contracts.each do |con|
          adjusted_contract_length = con.contract_length
          if con.is_extended
            adjusted_contract_length += 1 # adjusting for the extra year for an extension
          end

          if con.is_franchised
            adjusted_contract_length += 1 # adjusting for the extra year for a franchise
          end


          if (con.contract_start_year + adjusted_contract_length) > current_year # checking to see if contracts in these_contracts are current
            return true # there is a current contract
          end

        end
        return false # no contract meets the necessary criteria
      else
        return false # these_contracts was 0
      end
    end
    
  end

  # used in conjection with is_contracted? to return the actual contract if is_contracted? == true
  def current_contract
    self.this_year.contract
  end


  def this_year # used for getting the subcontract for the current year to display the correct team name on the players#index action
    self.subcontracts.each do |sub|
      if sub.contract_year == current_year && !sub.contract.is_bought_out
        return sub
      end
    end
  end
  
  def this_team_contract(team) # needed to pull in only the non-bought-out contract for subcontracts on the team#show page
    if self.is_contracted?
      self.subcontracts.current_year_or_later.each do |sub|
        return sub.contract if sub.team_id == team.id
      end
    else
      self.subcontracts.each do |sub|
        return sub.contract if sub.team_id == team.id
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

  def self.free_agents
    players = []

    self.order('auction_value desc').each do |player|
      unless player.is_contracted?
        players << player
      end
    end

    players
  end

  def this_year_salary
    if self.is_contracted?
      self.this_year.salary_amount
    else
      self.auction_value
    end
  end

  def average_salaries(top_5_players_of_position)
    total_salary = 0
    top_5_players_of_position.each do |player|
      total_salary += player.this_year_salary
    end 
    total_salary /= 5
  end




  # checking to see how much it would cost to extent this player now
  #def to_extend_now
    #length = self.this_year.contract.contract_length
    #current_contract = Contract.find(self.this_year.contract.id)
    #auction_value = current_contract.subcontracts.first.salary_amount

    #this_progression = SalaryProgression.find_by_auction_value(auction_value)

    #next_salary = this_progression[(length + 1)][1]

    #return next_salary
  #end

  
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
