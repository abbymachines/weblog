FactoryBot.define do
  factory :topic do
    topic_name { "conversation starter" }
  end

  factory :article do
    title { "Place holding" }
    body { "Lorem ipsum indeed" }
    status { "public" }
  end

  factory :comment do
    commenter { "sophie" }
    body { "tomato soup can" }
    status { "public" }
    topic_id { 1 }
    article_id { 1 }
  end
end
