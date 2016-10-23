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

  context "relationship with Maker" do
    let(:new_maker) { FactoryGirl.create(:maker)}
    let(:new_provider) { FactoryGirl.create(:provider)}
    subject(:relationship) { FactoryGirl.create(:maker_provider, provider: new_provider, maker: new_maker)}

    it "must have a relationship with the Maker" do
      expect(new_provider.makers).to include(relationship)
    end
  end

end
