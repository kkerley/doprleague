class Contract < ActiveRecord::Base
  attr_accessible :contract_length, :is_bought_out, :bought_out_by_team_id, :is_extended, :is_franchised, :contract_start_year, :contracted_team, :player_id, :subcontracts_attributes, :is_drafted, :is_dead_money
  attr_accessor :contracted_team
  
  belongs_to :player
  has_many :subcontracts, dependent: :destroy
  has_many :teams, through: :subcontracts
  
  accepts_nested_attributes_for :subcontracts
  

  after_create :create_subcontracts

  after_update :check_for_buyout, :if => Proc.new { |a| a.is_bought_out_changed? }
  after_update :check_for_extension, :if => Proc.new { |a| a.is_extended_changed? }
  after_update :check_for_franchise, :if => Proc.new { |a| a.is_franchised_changed? }

  def create_subcontracts
    contracted_team_id = self.contracted_team
    player = Player.find(self.player_id)
    salary = player.auction_value
   
    salary_progression = SalaryProgression.find_by_auction_value(salary).attributes.to_a

    contract_start_year = self.contract_start_year
    
    self.contract_length.times do |i|
      sub = Subcontract.new
      sub.contract_year = contract_start_year + i
      i += 1
      sub.salary_amount = salary_progression[i][1]
      sub.contract_id = self.id
      sub.team_id = contracted_team_id
      sub.save!
    end
     
  end


  # Logic for applying buyout conditions to the remainder of a contract if is_bought_out is checked
  def check_for_buyout
    if self.is_bought_out
      self.subcontracts.current_year_or_later.each do |sub|
        sub.salary_amount *= 0.6
        sub.save!
      end
    end
  end


  # Logic for applying a contract extension to a contract if is_extended is checked
  def check_for_extension
    if self.is_extended
      length = self.contract_length
      original_salary = self.subcontracts.first.salary_amount
      contracted_team_id = self.subcontracts.last.team_id
      
      salary_progression = SalaryProgression.find_by_auction_value(original_salary).attributes.to_a

      # create the Subcontract
      sub = Subcontract.new
      sub.contract_year = contract_start_year + length
      sub.salary_amount = salary_progression[(length + 1)][1]
      sub.contract_id = self.id
      sub.team_id = contracted_team_id
      sub.save!
    end
  end


  # Logic for franchising a player contract if is_franchised is checked
  def check_for_franchise
    if self.is_franchised
      player = Player.find(self.player_id)
      length = self.contract_length
      position = player.position
      averaged_player_salary = 0
      final_salary = 0
      this_salary = 0
      contracted_team_id = self.subcontracts.last.team_id
      all_players_of_position = Player.where("position = ?", player.position).first(5)

      all_players_of_position.each do |top_player|
        if top_player.is_contracted?
          this_salary = top_player.this_year.salary_amount
        else
          this_salary = top_player.auction_value
        end
        averaged_player_salary += this_salary
      end
      averaged_player_salary /= 5


      salary_progression = SalaryProgression.find_by_auction_value(player.auction_value).attributes.to_a

      if player.this_year.contract.is_extended
        salary = salary_progression[(length + 2)][1]
      else
        salary = salary_progression[(length + 1)][1] 
      end 
      if averaged_player_salary >= salary
          final_salary = averaged_player_salary
      else
        final_salary = salary
      end 

      # create the Subcontract
      sub = Subcontract.new
      if self.is_extended
        sub.contract_year = contract_start_year + length + 1
      else
        sub.contract_year = contract_start_year + length
      end
      sub.salary_amount = final_salary
      sub.contract_id = self.id
      sub.team_id = contracted_team_id
      sub.save!  
    end
  end
end
