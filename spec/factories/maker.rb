FactoryGirl.define do
  factory :maker do
    id { generate(:id) }
    name Faker::Name.name
    provider nil
    provider_make_id { Random.rand(1...999) }
  end
end