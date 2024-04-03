# in the 'arrange/act' just hit the endpoint (i.e. youre not seeding the data into the test database for this particular test first; youre passing it through the API call)

require "rails_helper"

RSpec.describe 'Comment', type: :request do
  before { @article = Article.new(title: 'all about lorems', body: 'ipsums and such. even a dolor sit amet', status: 'public') }
  before { @topic = Topic.create(topic_name: 'celebrations') }

  context 'created without body' do
    it 'returns 400 http status' do
      post '/comments', :params => { }
      expect(response).to have_http_status(400)
    end
  end

  context 'created with params' do
    it 'returns 200 http status' do
      article = @article
      article.id = 1
      article.save

      topic = @topic
      topic.id = 1
      topic.save

      headers = { 'ACCEPT' => 'application/json '}
      post '/comments', :params => { :comment => {"commenter": "Abigail", "body": "hooray", "status": "public", "topic_id": 1, "article_id": 1 }}
      # binding.pry
      expect(response).to have_http_status(200)
    end
  end
end
