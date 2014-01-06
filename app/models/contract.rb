class Contract < ActiveRecord::Base
  attr_accessible :contract_length, :is_bought_out, :bought_out_by_team_id, :is_extended, :is_franchised, :contract_start_year, :contracted_team, :player_id, :subcontracts_attributes, :is_drafted, :is_dead_money
  attr_accessor :contracted_team
  
  belongs_to :player
  has_many :subcontracts, dependent: :destroy
  has_many :teams, through: :subcontracts
  
  accepts_nested_attributes_for :subcontracts
  

  after_create :create_subcontracts

  after_update :check_for_buyout, :if => Proc.new { |a| a.is_bought_out_changed? }
  # after_update :check_for_extension, :if => Proc.new { |a| a.is_extended_changed? }

  def create_subcontracts
    contracted_team_id = self.contracted_team
    player = Player.find(self.player_id)
    salary = player.auction_value
    salary_progression = SalaryProgression.find(salary).attributes.to_a  

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
  
  def check_for_buyout
    if self.is_bought_out
      self.subcontracts.current_year_or_later.each do |sub|
        sub.salary_amount *= 0.6
        sub.save!
      end
    end
  end

  def check_for_extension
    if self.is_extended

    end
  end
end
