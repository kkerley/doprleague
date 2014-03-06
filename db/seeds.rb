# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teams = Team.all
current_year = 2013

teams.each do |team|
  50.times { 
	  b = Budget.new
	  b.team_id = team.id
	  b.year = current_year
	  current_year += 1
	  b.save!
	}
	current_year = 2013
end