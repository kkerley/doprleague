FactoryGirl.define do
  
  factory :user do
    email { |n| "person#{n}@example.com" }
		display_name { |n| "person#{n}" }
		password "guessthis"
		is_current true
		role 'admin'
	

		after(:create) do |user|
			team = FactoryGirl.create(:team, user: user)
		end

		# trait :admin do
			# after(:create) {|user| user.role = 'admin'}
			# role = 'admin'
    # end
		
  end


  factory :admin, class: User do
    email { |n| "person#{n}@example.com" }
		display_name { |n| "person#{n}" }
		password "guessthis"
		is_current true
		role 'admin'

		after(:create) do |user|
			team = FactoryGirl.create(:team, user: user)
		end
  end

  factory :team do
  	team_name "Hilarious Team Name" 
  	division "Philip"
  	association :user, factory: :user
  	
  end

  factory :draft_roster do
		name "User's Draft Roster"
		association :team, factory: :team
  end

  
end