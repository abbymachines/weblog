class AddTopicNameToTopics < ActiveRecord::Migration[7.1]
  def change
    add_column :topics, :topic_name, :string
  end
end
