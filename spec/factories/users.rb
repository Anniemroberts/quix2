FactoryGirl.define do
  factory :user do
    name        { Faker::Name.first_name }
    sequence(:email)  {|n| Faker::Internet.email.gsub('@', "-#{n}@")  }
    password          'abcd1234'
  end
end
