# in the 'arrange/act' just hit the endpoint (i.e. youre not seeding the data into the test database for this particular test first; youre passing it through the API call)

# also: practice mocking

require "rails_helper"

RSpec.describe 'Comment' do
  before { @example_string = 'hello rspec' }
  before { @comment = Comment.create }

  context 'made without data' do
    it 'has nil topic' do
      comment = @comment

      expect(comment.topic_id).to equal(nil)
    end
  end

  context 'but actually example string' do
    it 'is hello world' do
      string = @example_string

      expect(string).to equal('hello world')
    end
  end
end
