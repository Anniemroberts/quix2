FactoryGirl.define do
  factory :idea do
    association :user, factory: :user

    title       { Faker::Hipster.sentence }
    description { Faker::Hacker.say_something_smart }
  end
end
