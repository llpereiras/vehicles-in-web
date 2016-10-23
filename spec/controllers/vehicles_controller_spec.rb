require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  before (:all) do
    DatabaseCleaner.clean_with(:deletion)
  end

  describe "Json-schema validator", json_schema: true do

    context "Action #index" do
      let(:maker) { FactoryGirl.create(:maker)}
      let(:vehicle) { FactoryGirl.create(:vehicle, maker: maker)}
      subject(:request_index) { get :index, {:maker_id => maker.id, :format => :json } }

      it do
        request_index
        expect(response).to match_response_schema("vehicles")
      end
    end

  end

end
