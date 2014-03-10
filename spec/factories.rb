FactoryGirl.define do
  factory :user do
    email { |n| "person#{n}@example.com" }
		display_name { |n| "person#{n}" }
		password "guessthis"
		is_current true

		factory :admin do
		  is_admin true
		end

		after(:create) do |user|
			user.team = FactoryGirl.create(:team)
		end
		
  end

  factory :team do
  	team_name "Hilarious Team Name"
  	division "Philip"
  	# association :user, factory: :user
  	after(:create) do |team|
  		def current_year
		    # The new seasons starts on 8/1 so technically, it's the previous year through 7/31
		    current_date = Time.now
		    if current_date.month < 8
		      current_date.year - 1
		    else
		      current_date.year
		    end
		  end

  		 50.times { 
  		 	current_year = Time.now.year
			  b = Budget.new
			  b.team_id = team.id
			  b.year = current_year
			  current_year += 1
			  b.save!
			}
  	end
  end

  factory :draft_roster do
		name "User's Draft Roster"
		association :team, factory: :team
  end

  
end