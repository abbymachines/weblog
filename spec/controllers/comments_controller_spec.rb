# in the 'arrange/act' just hit the endpoint (i.e. youre not seeding the data into the test database for this particular test first; youre passing it through the API call)

require "rails_helper"

RSpec.describe 'Comment', type: :request do
  context 'created without body' do
    it "returns 400 http status" do
      # headers = { 'ACCEPT' => 'application/json' }
      post '/comments', :params => { }
      expect(response).to have_http_status(400)
    end
  end
end
