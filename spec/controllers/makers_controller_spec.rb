require 'rails_helper'

RSpec.describe MakersController, type: :controller do
  before (:all) do
    DatabaseCleaner.clean_with(:deletion)
  end

  describe "Json-schema validator", json_schema: true do

    context "Action #index" do
      let(:maker) { FactoryGirl.create(:maker)}
      subject(:request_index) { get :index, {:format => :json } }

      it do
        request_index
        expect(response).to match_response_schema("makers")
      end
    end

  end

end
