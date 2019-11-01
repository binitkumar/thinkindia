class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :comments

  def current_status
    if self.accepted
      "Accepted"
    elsif self.rejected
      "Rejected"
    else
      "In moderation"
    end
  end
end
