require "rails_helper"

RSpec.describe MakersController, :type => :routing do
  describe "routing" do

    subject(:resource) {'makers'}

    context "resource to list makers" do
      it { expect(:get => "/#{resource}").to route_to("#{resource}#index", format: :json) }
    end

    describe "nested resource with Vehicles" do
      context "resource to list vehicles of maker" do
        let(:maker) { FactoryGirl.create(:maker)}
        it { expect(get: "/#{resource}/#{maker.id}/vehicles").to route_to("vehicles#index", maker_id: maker.id.to_s, format: :json) }
      end
    end

  end
end