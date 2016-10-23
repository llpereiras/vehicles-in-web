FactoryGirl.define do
  factory :maker do
    id { generate(:id) }
    name Faker::Name.name
  end
end