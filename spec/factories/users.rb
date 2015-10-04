FactoryGirl.define do
  factory :user do
    is_active false
    factory :validUser, class: User do
      email_id Faker::Internet.email
	    full_name Faker::Lorem.characters(29)
	    team_name Faker::Lorem.characters(20)
	    password Faker::Internet.password(5, 20)
    end

    factory :invalidUser, class: User do
      email_id "sample@.com"
	    team_name Faker::Lorem.characters(21)
	    full_name Faker::Lorem.characters(31)
	    password Faker::Internet.password(1, 5)
    end
  end
end
