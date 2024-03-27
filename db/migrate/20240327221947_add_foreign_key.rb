class AddForeignKey < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :topics, foreign_key: true
  end
end
