# in the 'arrange/act' just hit the endpoint (i.e. youre not seeding the data into the test database for this particular test first; youre passing it through the API call)

require "rails_helper"

RSpec.describe 'Comment', type: :request do
  before { @article = Article.new(title: 'all about lorems', body: 'ipsums and such. even a dolor sit amet', status: 'public') }
  before { @topic = Topic.create(topic_name: 'celebrations') }

  context 'created without body' do
    it 'returns 400 http status' do
      post '/articles/1/comments', :params => { }
      # binding.pry
      expect(response).to have_http_status(400)
    end
  end

  context 'created without topic_id' do
    it 'does not generate primary key' do
      comment = Comment.create(article_id: 1, 'commenter': 'Aristotle', body: 'i only dont know that which i know i do or dont. or no. wait')
      expect(comment.topic_id).to match(nil)
    end
  end
end

# temp change
