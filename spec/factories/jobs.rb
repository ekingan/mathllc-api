FactoryBot.define do
  factory :job do
    form { Faker::Number.between(1,4) }
    states { Faker::Address.state }
    status { Faker::Number.between(1,4) }
    printed { Faker::Boolean.boolean }
    scanned { Faker::Boolean.boolean }
    uploaded { Faker::Boolean.boolean }
    filed { Faker::Date.between(2.days.ago, Date.today) }
    accepted { Faker::Boolean.boolean }
    rejected false
    notes { Faker::Lorem.sentence(3) }
    job_type { Faker::Number.between(1,4) }
    price { Faker::Commerce.price }
    confirm_ack false
    paid_in_full { Faker::Boolean.boolean }
  end
end