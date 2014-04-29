class User < ActiveRecord::Base
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model


  ROLES = %w[admin regular former]
  
  attr_accessible :email, :password, :is_current, :password_confirmation, :is_admin, :display_name, :awards_attributes, :teams_attributes, :team_attributes, :avatar, :role, :remember_me
   
  has_many :awards
  has_many :features
  has_one :team

  accepts_nested_attributes_for :team

  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :display_name
  validates_uniqueness_of :email
  

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "32x32>", :tiny => "16x16>" }, :default_url => "/images/:style/missing.png"

  default_scope order('display_name ASC')
  
  scope :current_members, lambda { where(is_current: true) }
  scope :past_members, lambda { where(is_current: false) }
  
  def to_param
    "#{self.id}-#{self.display_name}".parameterize
  end

  def first_name
    self.display_name.split(' ', 2)[0]
  end
  
  def self.list_user_options
    User.select("id, display_name").map {|x| [x.id, x.display_name] }
  end
  
  def total_winnings
    awards = self.awards
    total_amount = 0
    
    awards.each do |award|
      total_amount += award.amount
    end
    return total_amount
  end

  # customizing JSON output for amCharts
  def as_json(options = {})
    { :display_name => self.display_name, :total_winnings => self.total_winnings }
  end

  # Mailboxer methods
  def name
    return self.display_name
  end

  def mailboxer_email(object)
    return self.email
  end

end
