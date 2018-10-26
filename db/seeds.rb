50.times do
  client = Client.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    company: Faker::Company.name,
    date_of_birth: Faker::Date.birthday(18, 65),
    email: Faker::Internet.email,
    occupation: Faker::Job.title,
    entity_type: Faker::Number.between(1,4),
    filing_status: Faker::Number.between(1,4),
    tax_id: Faker::Number.number(4),
    user_id: User.first.id
  )
end

50.times do
  job = Job.create(
    form: Faker::Number.between(1,4),
    states: Faker::Address.state,
    status: Faker::Number.between(1,4),
    printed: Faker::Boolean.boolean,
    scanned: Faker::Boolean.boolean,
    uploaded: Faker::Boolean.boolean,
    filed: Faker::Date.between(2.days.ago, Date.today),
    accepted: Faker::Boolean.boolean,
    rejected: false,
    notes: Faker::Lorem.sentence(3),
    job_type: Faker::Number.between(1,4),
    price: Faker::Commerce.price,
    confirm_ack: false,
    paid_in_full: Faker::Boolean.boolean,
    client_id: Client.find_by_id(rand(1..50)),
    user_id: User.first.id
  )
end