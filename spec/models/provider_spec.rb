require 'rails_helper'

RSpec.describe Provider, type: :model do
  before(:all) do
    DatabaseCleaner.clean_with(:deletion)
  end
  
  describe ".save" do
    
    subject(:unnamed) { FactoryGirl.build(:provider, name: nil)}
    subject(:named) { FactoryGirl.build(:provider)}
    
    it "should not save unnamed Provider" do
      expect(unnamed.save).to be false
    end

    it "should save named Provider" do
      expect(named.save).to be true
    end
    
  end
  
  context "relationship with makers" do
    
    subject(:new_provider) { FactoryGirl.create(:provider)}
    let!(:generate_makers) do
      FactoryGirl.create(:maker, provider: new_provider)
      FactoryGirl.create(:maker, provider: nil)
    end

    it "there must be 2 makers saved" do
      expect(Maker.all).to have_exactly(2).items
    end
    
    it "there must be 1 maker related to the Provider" do
      expect(Maker.where('provider_id is not null')).to have_exactly(1).items
    end
    
  end

end
