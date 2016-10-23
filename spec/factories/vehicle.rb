FactoryGirl.define do
  factory :vehicle do
    id { generate(:id) }
    name Faker::Name.name
    maker { FactoryGirl.create(:maker) }
    category [0, 1].sample
  end
end