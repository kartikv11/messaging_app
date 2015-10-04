FactoryGirl.define do
  factory :channel, class: Channel do

    factory :channelWithWrongName do
      channel_name "Technologysdongldnrfg"
    end

    factory :channelWithCorrectName do
  	  channel_name "Technology"
    end
  end
end