class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  belongs_to :topic

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }
  validates :topic_id, presence: true

  def archived?
    status == 'archived'
  end
end
