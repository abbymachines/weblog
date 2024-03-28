class AddTopicRefToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :topic, null: false, foreign_key: true
  end
end
