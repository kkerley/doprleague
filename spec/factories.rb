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
			sb_pick = FactoryGirl.create(:super_bowl_pick, team_id: team.id)
		end
  end


  factory :admin, class: User do
    email "admin@example.com"
		display_name "admin"
		password "guessthis"
		is_current true
		role 'admin'

		after(:create) do |admin|
			team = FactoryGirl.create(:team, user: admin)
		end
  end

  factory :team do
  	team_name
  	division "Philip"
  	association :user, factory: :user
  	
  end

  factory :super_bowl do
  	year 2014
  	nfl_team1_id 3 # Should be Patriots
  	nfl_team2_id 29 # Should be Cardinals
  end

  factory :draft_roster do
		name "User's Draft Roster"
		association :team, factory: :team
  end

  factory :super_bowl_pick do
  	nfl_team_id
  	super_bowl_id 1
  	# association :user, factory: :user
   # association :super_bowl, factory: :super_bowl
  end
  
end