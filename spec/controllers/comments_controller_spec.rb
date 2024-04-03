# in the 'arrange/act' just hit the endpoint (i.e. youre not seeding the data into the test database for this particular test first; youre passing it through the API call)

# also: practice mocking

RSpec.describe 'Comment' do
  before { @example_string = 'hello rspec' }

  context 'made without data' do
    it 'has nil topic' do
      expect(incomplete_comment.topic_id).to equal(nil)
    end
  end

  context 'but actually example string' do
    it 'matches example string' do
      string = @example_string

      expect(string).to equal('hello world')
    end
  end
end
