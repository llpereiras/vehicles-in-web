FactoryGirl.define do
  factory :provider do
    id { generate(:id) }
    name Faker::Name.name
  end
end