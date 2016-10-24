FactoryGirl.define do
  factory :maker_provider do
    id { generate(:id) }
    maker { FactoryGirl.create(:maker) }
    provider { FactoryGirl.create(:provider) }
    provider_make_id { Random.rand(1...999) }
  end
end