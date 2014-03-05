FactoryGirl.define do
	factory :user do
		email { |n| "person#{n}@example.com" }
		password "guessthis"
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