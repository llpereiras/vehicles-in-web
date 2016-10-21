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

  context "relationship with makers" do
    subject(:new_maker) { FactoryGirl.create(:maker, provider: FactoryGirl.create(:provider))}
  
    it "must have a relationship with the Provider" do
      expect(new_maker.provider).to be_an_instance_of Provider
    end

  end

end
