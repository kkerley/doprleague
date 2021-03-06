FactoryGirl.define do
	sequence(:email) { |n| "person#{n}@example.com" }
	sequence(:display_name) { |n| "person#{n}" }
	sequence(:nfl_team_id) { |n| "#{n}" }
	sequence(:team_name) { |n| "Hilarious Team Name #{n}"  }
  sequence(:combined_total) { |n| 30 + n }
  # sequence(:first_name) { |n| "first#{n}" }
  # sequence(:last_name) { |n| "last#{n}" }
  
  factory :user do
    email
    display_name
		password "guessthis123"
		password_confirmation "guessthis123"
		is_current true
		role 'admin'

		after(:create) do |user|
			team = FactoryGirl.create(:team, user: user)
			# sb_pick = FactoryGirl.create(:super_bowl_pick, team_id: team.id)
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


  factory :user_tie_breaker, class: User do
    email
    display_name
    password "guessthis123"
    password_confirmation "guessthis123"
    is_current true
    role 'admin'
  

    after(:create) do |user|
      team = FactoryGirl.create(:team, user: user)
      sb_pick = FactoryGirl.create(:super_bowl_pick, team_id: team.id, nfl_team_id: 3)
    end
  end


  factory :user_tie_breaker2, class: User do
    email
    display_name
    password "guessthis123"
    password_confirmation "guessthis123"
    is_current true
    role 'admin'
  

    after(:create) do |user|
      team = FactoryGirl.create(:team, user: user)
      sb_pick = FactoryGirl.create(:super_bowl_pick, team_id: team.id, nfl_team_id: 29)
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

    after(:create) do
      payout = FactoryGirl.create(:payout)
    end
  end

  factory :draft_roster do
		name "User's Draft Roster"
		association :team, factory: :team
  end

  factory :super_bowl_pick do
  	nfl_team_id
  	super_bowl_id 1
    combined_total
  	# association :user, factory: :user
   # association :super_bowl, factory: :super_bowl
  end

  factory :payout do
    year 2014

    after(:create) do |payout|
      award = FactoryGirl.create(:award, payout_id: payout.id)
    end
  end

  factory :award do
    name "NFL Super Bowl prediction"
    amount 5
   
  end

  factory :player do 
    # auction_value 17
    # first_name 
    # last_name
    # nfl_team
    # position
    bye_week 9
  end

  factory :contract do
    # contract_length
    is_bought_out false
    # bought_out_by_team_id
    is_extended false
    is_franchised false
    contract_start_year 2013
    # contracted_team
    # player_id
    is_drafted true
    is_dead_money false
  end
  
end