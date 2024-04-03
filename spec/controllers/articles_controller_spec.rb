require "rails_helper"

# create the data for the test
# also do a comments controller test instead

RSpec.describe ArticlesController, type: :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
