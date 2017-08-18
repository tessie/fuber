FactoryGirl.define do
  factory :trip do
    starting_lat '9.997090'
    starting_long '76.302815'
    association :cab
    association :customer
  end
end
