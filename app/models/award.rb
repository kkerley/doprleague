class Award < ActiveRecord::Base
  attr_accessible :amount, :name, :user_id, :notes, :awards_attributes, :users_attributes
  
  belongs_to :user
  belongs_to :payout
  
  
end
