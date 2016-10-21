FactoryGirl.define do
  factory :vehicle do
    id { generate(:id) }
    name Faker::Name.name
    maker { FactoryGirl.create(:maker) }
    type [0, 1].sample
  end
end