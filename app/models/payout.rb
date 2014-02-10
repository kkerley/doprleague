class Payout < ActiveRecord::Base
  attr_accessible :year, :awards_attributes, :users_attributes
  
  has_many :awards
  
  accepts_nested_attributes_for :awards,
                                :reject_if => :all_blank,
                                :allow_destroy => true
                                
  default_scope order('year DESC')
  
  def initialize_form(count)
    yearly_award_names = [["Champion", 600], 
                      ["Runner up", 300], 
                      ["Third place", 100], 
                      ["Philip Division Champ", 40], 
                      ["Russell Division Champ", 40], 
                      ["Most points during the season", 25],
                      ["High score - Week 1", 5],
                      ["High score - Week 2", 5],
                      ["High score - Week 3", 5],
                      ["High score - Week 4", 5],
                      ["High score - Week 5", 5],
                      ["High score - Week 6", 5],
                      ["High score - Week 7", 5],
                      ["High score - Week 8", 5],
                      ["High score - Week 9", 5],
                      ["High score - Week 10", 5],
                      ["High score - Week 11", 5],
                      ["High score - Week 12", 5],
                      ["High score - Week 13", 5],
                      ["Highest weekly total/season", 10],
                      ["Smallest margin of defeat", 5],
                      ["Worst record", 5],
                      ["Losing to lowest winning score", 5],
                      ["NFL Super Bowl prediction", 5]]
    
    
    count.times{ |i|
      self.awards.build
      awards[i].name =  yearly_award_names[i][0]
      awards[i].amount =  yearly_award_names[i][1]
      
    }
  end
  
  def yearly_total
    yearly_awards = self.awards
    total = 0

    yearly_awards.each do |a| 
      total += a.amount 
    end
    total
  end
end
