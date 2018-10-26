FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role :admin
    email 'info@mathllc.com'
    password 'password'
  end
end