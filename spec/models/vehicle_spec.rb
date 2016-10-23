require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  before(:all) do
    DatabaseCleaner.clean_with(:deletion)
  end
  
  describe ".save" do
    
    subject(:unnamed) { FactoryGirl.build(:vehicle, name: nil)}
    subject(:without_category) { FactoryGirl.build(:vehicle, category: nil)}
    subject(:without_maker) { FactoryGirl.build(:vehicle, maker: nil)}
    subject(:fit) { FactoryGirl.build(:vehicle)}
    
    it "should not save unnamed Vehicle" do
      expect(unnamed.save).to be false
    end

    it "should not save Vehicles without category" do
      expect(without_category.save).to be false
    end

    it "should not save Vehicles without maker" do
      expect(without_maker.save).to be false
    end

    it "should save Vehicle that is fit" do
      expect(fit.save).to be true
    end
    
  end

  context "relationship with makers" do
    subject(:new_vehicle) { FactoryGirl.create(:vehicle)}
  
    it "must have a relationship with the Maker" do
      expect(new_vehicle.maker).to be_an_instance_of Maker
    end

  end

  context "vehicle category" do
    subject(:new_vehicle) { FactoryGirl.create(:vehicle)}

    it "must have one of enum categories" do
      expect(new_vehicle.category).to be_into_array Vehicle.categories
    end
  end
end
