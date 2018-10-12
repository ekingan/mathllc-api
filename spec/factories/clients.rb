FactoryBot.define do
  factory :client do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    company { Faker::Company.name }
    date_of_birth { Faker::Date.birthday(18, 65) }
    email { Faker::Internet.email }
    occupation { Faker::Job.title }
    entity_type { Faker::Number.between(1,4) }
    filing_status { Faker::Number.between(1,4) }
    tax_id { Faker::Number.number(4) }
  end
end