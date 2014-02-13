class Event < ActiveRecord::Base
  attr_accessible :event_date, :description, :event_type, :team_id, :title

  belongs_to :team

  scope :global, lambda { where(event_type: "Global") }


  def self.get_personal_and_global_events(user)
  	global_events = Event.global
  	personal = Event.where("team_id = ?", user.team.id)

  	all_personal_and_global = global_events + personal

  	return all_personal_and_global.uniq
  end
end
