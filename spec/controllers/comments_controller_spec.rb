# in the 'arrange/act' just hit the endpoint (i.e. youre not seeding the data into the test database for this particular test first; youre passing it through the API call)

# also: practice mocking

# require "rails helper"

# RSpec.describe CommentsController, type: :controller do
#   describe "GET index" do
#     it "has a 200 status code" do
#       get :index
#       expect(response.status).to eq(200)
#     end
#   end
# end

# RSpec.describe 'Post' do
#   context 'before publication' do
#     it 'cannot have comments' do
#       expect { Post.create.comments.create! }.to raise_error(ActiveRecord::Invalid)
#     end
#   end
# end

RSpec.describe 'Comment' do
  context 'before publication' do
    it 'cannot have a topic' do
      expect { Comment.create.topic_id.create! }.to raise_error(ActiveRecord::Invalid)
    end
  end
end
