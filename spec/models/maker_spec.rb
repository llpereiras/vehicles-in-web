require 'rails_helper'

RSpec.describe Maker, type: :model do
  before(:all) do
    DatabaseCleaner.clean_with(:deletion)
  end
  
  describe ".save" do
    
    subject(:unnamed) { FactoryGirl.build(:maker, name: nil)}
    subject(:named) { FactoryGirl.build(:maker)}
    
    it "should not save unnamed Maker" do
      expect(unnamed.save).to be false
    end

    it "should save named Maker" do
      expect(named.save).to be true
    end
    
  end

  context "relationship with Provider" do
    let(:new_maker) { FactoryGirl.create(:maker)}
    let(:new_provider) { FactoryGirl.create(:provider)}
    subject(:relationship) { FactoryGirl.create(:maker_provider, provider: new_provider, maker: new_maker)}

    it "must have a relationship with the Provider" do
      expect(new_maker.providers).to include(relationship)
    end
  end

end
