class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :is_current, :password_confirmation, :is_admin, :display_name, :awards_attributes, :teams_attributes

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :display_name
  validates_uniqueness_of :email
  
  has_many :awards
  has_one :team

  default_scope order('display_name ASC')
  
  scope :current_members, lambda { where(is_current: true) }
  scope :past_members, lambda { where(is_current: nil) || where(is_current: false) }
  
  def total_winnings
    @awards = self.awards
    @total_amount = 0
    
    @awards.each do |award|
      @total_amount += award.amount
    end
    return @total_amount
  end
end
