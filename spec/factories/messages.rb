FactoryGirl.define do
  factory :message do
  	user 1

    factory :validMessage do
      content Faker::Lorem.characters(260)
    end

    factory :invalidMessage do
  	  content ""
    end
  end
end
