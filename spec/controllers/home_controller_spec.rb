require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  before (:all) do
    DatabaseCleaner.clean_with(:deletion)
  end

  describe ".index" do
    subject(:request_home) { get :index }

    it "should return the html content" do
      request_home
      expect(response["Content-Type"]).to include("text/html")
    end
  end

end