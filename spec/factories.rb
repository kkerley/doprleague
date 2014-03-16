FactoryGirl.define do
	sequence(:email) { |n| "person#{n}@example.com" }
	sequence(:display_name) { |n| "person#{n}" }
	sequence(:nfl_team_id) { |n| "#{n}" }
	sequence(:team_name) { |n| "Hilarious Team Name #{n}"  }
  
  factory :user do
    email
    display_name
		password "guessthis123"
		password_confirmation "guessthis123"
		is_current true
		role 'admin'
	

		after(:create) do |user|
			team = FactoryGirl.create(:team, user: user)
			sb_pick = FactoryGirl.create(:super_bowl_pick, team: team)
		end
  end


  factory :admin, class: User do
    email { |n| "admin#{n}@example.com" }
		display_name { |n| "admin#{n}" }
		password "guessthis"
		is_current true
		role 'admin'

		after(:create) do |user|
			team = FactoryGirl.create(:team, user: user)
		end
  end

  factory :team do
  	team_name
  	division "Philip"
  	association :user, factory: :user
  	
  end

  factory :super_bowl do
  	# SuperBowl attributes
		# :dopr_winner_id, :nfl_team1_final_score, :nfl_team1_id, :nfl_team2_final_score, :nfl_team2_id, :nfl_winner_id, :tie_breaker, :year
  	year 2014
  	nfl_team1_id 3 # Should be Patriots
  	nfl_team2_id 29 # Should be Cardinals
  	
  	# nfl_winner_id 3

  end

  factory :draft_roster do
		name "User's Draft Roster"
		association :team, factory: :team
  end

  factory :super_bowl_pick do
  	nfl_team_id
  	super_bowl_id 1
  end
  
end